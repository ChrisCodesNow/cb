class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to comments_url
    end
  end
end
