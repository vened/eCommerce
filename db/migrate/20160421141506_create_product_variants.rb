class CreateProductVariants < ActiveRecord::Migration
  def change
    create_table :product_variants do |t|
      t.string :sku, index: true
      t.string :name
      t.decimal :price, index: true
      t.decimal :old_price, index: true

      t.belongs_to :product, index: true

      t.timestamps null: false
    end
  end
end
