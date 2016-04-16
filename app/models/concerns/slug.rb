module Slug
  extend ActiveSupport::Concern



  def generate_slug
    if self.parent_id.present?
      parent_category = Category.find(self.parent_id)
      name_params    = parent_category.self_and_ancestors.map(&:name).join(" ") + " " + self.name
    else
      name_params = self.name
    end
    self.slug = name_params.parameterize
  end

end
