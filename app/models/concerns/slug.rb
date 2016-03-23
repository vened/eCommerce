module Slug
  extend ActiveSupport::Concern


  def generate_slug
    self.slug = self.title.parameterize
  end

end
