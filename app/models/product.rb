class Product < ActiveRecord::Base
  include Slug

  has_many :products_categories
  has_many :categories, through: :products_categories

  has_many :photos, as: :image
  has_many :product_variants

  validates :name, presence: true

  #<<<
  # генерация slug при сохранении
  before_save :generate_slug
  before_update :generate_slug
  #>>>


  def to_param
    self.slug
  end

  # создание базовой категории товара
  # product.category_create(category_id)
  def category_create (category_id)
    category = Category.find_by_id(category_id)
    unless self.categories.exists?(category)
      self.categories << category
    end
    products_categories = self.products_categories
    products_categories.each do |products_category|
      if products_category.category_id == category.id
        products_category.update(root_category: true)
      else
        products_category.update(root_category: false)
      end
    end
  end

  # получение базовой категории товара
  # product.category
  def category
    category = self.products_categories.find_by_root_category(true)
    if category.present?
      Category.find_by_id(category.category_id)
    else
      nil
    end
  end

  # получение фото товара
  # product.photo
  def photo
    variant = self.product_variants.first

    product_photo = self.photos.first

    if variant.present?
      photo = variant.photos.first
      if photo.present?
        return photo
      else
        return product_photo
      end
    else
      return product_photo
    end
  end

end
