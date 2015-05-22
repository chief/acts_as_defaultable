class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :default
      t.integer :default_blog_post
      t.timestamps
    end
  end
end
