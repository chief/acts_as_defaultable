require 'active_support/concern'

module ActsAsDefaultable
  extend ActiveSupport::Concern

  included do
    def self.acts_as_defaultable(*options)

      after_save :set_unique_default

      column = options.first
      column ||= :default
      column = column.to_s


      puts "acts_as_defaultable: Specify a column #{column} in #{self}" unless column_names.include?(column)

      if column_names.include?(column)
        positive_value =
          case columns_hash[column].type
          when :integer
            1
          when :boolean
            true
          when :string
            "'on'"
          end

        negative_value =
          case columns_hash[column].type
          when :integer
            0
          when :boolean
            false
          when :string
            "'off'"
          end
      end

      class_methods = %(
        def self.default_column
          "#{column}"
        end

        def self.default_positive_value
          #{positive_value}
        end

        def self.default_negative_value
          #{negative_value}
        end
      )

      class_eval <<-EOF

        #{class_methods}

        def self.default
          all_defaults.first
        end

        def self.all_defaults
          where(default_column => default_positive_value)
        end

        def set_unique_default
          if send(self.class.default_column) == self.class.default_positive_value
            self.class.all_defaults.reject{ |x| x == self }.each do |obj|
              obj.update_attribute self.class.default_column, self.class.default_negative_value
            end
          end
        end

      EOF

    end
  end

end

ActiveRecord::Base.send :include, ActsAsDefaultable
