json.array!(@configs) do |config|
  json.extract! config, :id, :sitename, :google_analytics, :google_analytics_counter_id, :scripts
  json.url config_url(config, format: :json)
end
