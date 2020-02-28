class SessionsController < ApplicationController
    def new
        
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user
            log_in(user)
            redirect_to user_url(user)
        else
            render 'new'
        end
    end

    def destroy
        log_out
        redirect_to new_user_url
    end
end
