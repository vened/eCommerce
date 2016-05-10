class Category < ActiveRecord::Base
  include CategorySlug
  acts_as_nested_set
  mount_uploader :photo, PhotoUploader

  has_many :products_categories
  has_many :products, through: :products_categories

  validates :name, :title, presence: true
  validates :title, :slug, uniqueness: true

  #<<<
  # генерация slug при сохранении
  before_save :generate_slug
  before_update :generate_slug
  #>>>


  def to_param
    self.slug
  end


end
