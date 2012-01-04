class CreateAnothers < ActiveRecord::Migration
  def change
    create_table :anothers do |t|
      t.string  :test
      t.integer :unique
      t.timestamps
    end
  end
end
