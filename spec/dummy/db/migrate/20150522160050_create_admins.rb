class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.boolean :main
      t.string :main_blog_post
      t.timestamps
    end
  end
end

