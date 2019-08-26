class StatusController < ApplicationController

    def status_app
        render json: {message: 'connected'}, status: 200
    end
end
