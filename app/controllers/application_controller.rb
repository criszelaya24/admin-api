class ApplicationController < ActionController::API
    include Knock::Authenticable

    def is_admin?
        render json: {"error": "Not an admin"}, status: 401 unless current_user.admin?
    end
end
