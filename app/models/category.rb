class Category < ActiveRecord::Base
  include Slug
  acts_as_nested_set

  #<<<
  # генерация slug при сохранении
  before_save :generate_slug
  before_update :generate_slug
  #>>>


  def to_param
    self.slug
  end


end
