class Config < ActiveRecord::Base

  validates :google_analytics_counter_id, presence: true, if: "google_analytics"

end
