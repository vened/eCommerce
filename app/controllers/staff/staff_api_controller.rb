module Staff
  class StaffApiController < ActionController::Base
    # include AbstractController::Translation
    include ActionController::Serialization

    def default_serializer_options
      { root: false }
    end

    respond_to :json

    before_action :authenticate_admin!
  end
end
