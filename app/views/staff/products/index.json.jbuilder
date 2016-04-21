json.array!(@staff_products) do |staff_product|
  json.extract! staff_product, :id, :name, :slug, :hit, :new, :action, :active, :mini_desc, :desc, :meta_title, :meta_key, :meta_desc
  json.url staff_product_url(staff_product, format: :json)
end
