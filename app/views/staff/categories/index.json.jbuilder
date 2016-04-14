json.array!(@categories) do |category|
  json.extract! category, :id, :name, :title, :desc, :meta_title, :meta_key, :meta_desc, :slug, :pub
  json.url category_url(category, format: :json)
end
