class CreateProductsCategories < ActiveRecord::Migration
  def change
    create_table :products_categories do |t|
      t.boolean :root_category
      t.belongs_to :product, index: true
      t.belongs_to :category, index: true
      t.timestamps null: false
    end
  end
end
