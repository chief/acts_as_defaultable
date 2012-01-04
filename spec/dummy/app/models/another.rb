class Another < ActiveRecord::Base
  acts_as_defaultable :unique

  def to_s
    test
  end
end
