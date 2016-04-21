module Slug
  extend ActiveSupport::Concern



  def generate_slug
    self.slug = self.name.parameterize
  end

end
