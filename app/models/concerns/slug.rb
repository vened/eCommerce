module Slug
  extend ActiveSupport::Concern


  def generate_slug
    unless self.title.present?
      self.title = self.name
    end
    self.slug = self.title.parameterize
  end

end
