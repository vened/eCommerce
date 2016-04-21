class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :title
      t.string :meta_title
      t.string :meta_key
      t.text :meta_desc
      t.text :desc
      t.string :slug
      t.string :photo

      t.boolean :active, :null => false, :default => false

      t.integer :parent_id, :null => true, :index => true
      t.integer :lft, :null => false, :index => true
      t.integer :rgt, :null => false, :index => true

      # optional fields
      t.integer :depth, :null => false, :default => 0
      t.integer :children_count, :null => false, :default => 0

      t.timestamps null: false
    end
    add_index :categories, :title, unique: true
    add_index :categories, :slug, unique: true
  end
end
