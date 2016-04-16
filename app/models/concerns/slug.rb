module Slug
  extend ActiveSupport::Concern



  def generate_slug
    if self.parent_id.present?
      parent_category = Category.find(self.parent_id)
      title_params    = parent_category.self_and_ancestors.map(&:title).join(" ") + " " + self.title
    else
      title_params = self.title
    end
    self.slug = title_params.parameterize
  end

end
