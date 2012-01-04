class CreateFailOnes < ActiveRecord::Migration
  def change
    create_table :fail_ones do |t|

      t.string :name
      t.boolean :default

      t.timestamps
    end
  end
end
