class CreateBooleanDefaults < ActiveRecord::Migration
  def change
    create_table :boolean_defaults do |t|
      t.string :name
      t.boolean :default
      t.timestamps
    end
  end
end
