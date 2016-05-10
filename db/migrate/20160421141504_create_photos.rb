class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :attach
      t.integer :image_id
      t.string :image_type
      t.timestamps null: false
    end

    add_index :photos, [:image_type, :image_id]
  end
end
