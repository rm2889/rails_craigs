class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.belongs_to :category
      t.belongs_to :user

      t.timestamps
    end
  end
end
