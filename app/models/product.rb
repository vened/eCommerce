class Product < ActiveRecord::Base
  include Slug

  has_many :products_categories
  has_many :categories, through: :products_categories

  has_many :photos, as: :image

  validates :name, presence: true

  #<<<
  # генерация slug при сохранении
  before_save :generate_slug
  before_update :generate_slug
  #>>>


  def to_param
    self.slug
  end

end
