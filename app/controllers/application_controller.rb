class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user


    def authenticate
        if !user_signed_in?
            redirect_to :root
        end

    end


    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end


    def login_error
        @login_error ||= nil
    end


    def user_signed_in?
        # Ruby falsy values
        !!current_user
    end
end
