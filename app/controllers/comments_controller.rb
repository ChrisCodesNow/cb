class CommentsController < ApplicationController
    def new
        
    end

    
    def create
        render plain: params[:comment].inspect
    end
end
