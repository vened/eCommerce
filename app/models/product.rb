class Product < ActiveRecord::Base
  include Slug

  belongs_to :category
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
