class CreateTestDefaults < ActiveRecord::Migration
  def change
    create_table :test_defaults do |t|
      t.string  :name
      t.boolean :default, default: false
      t.timestamps
    end
  end
end
