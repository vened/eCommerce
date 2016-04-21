class Category < ActiveRecord::Base
  include Slug
  acts_as_nested_set
  mount_uploader :photo, PhotoUploader

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
