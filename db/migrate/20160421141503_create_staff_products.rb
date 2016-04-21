class CreateStaffProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.boolean :hit
      t.boolean :new
      t.boolean :action
      t.boolean :active
      t.text :mini_desc
      t.text :desc
      t.string :meta_title
      t.string :meta_key
      t.string :meta_desc

      t.timestamps null: false
    end
  end
end
