class Category < ActiveRecord::Base
  include Slug
  acts_as_nested_set

  validates :name, :title, presence: true
  validates :name, :title, uniqueness: true

  #<<<
  # генерация slug при сохранении
  before_save :generate_slug
  before_update :generate_slug
  #>>>

  def to_param
    self.slug
  end


end
