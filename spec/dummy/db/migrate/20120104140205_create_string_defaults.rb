class CreateStringDefaults < ActiveRecord::Migration
  def change
    create_table :string_defaults do |t|

      t.string :name
      t.string :default
      t.timestamps
    end
  end
end
