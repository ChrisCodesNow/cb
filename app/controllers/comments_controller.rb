class CommentsController < ApplicationController
    before_action :authenticate
    
    def index
        @comments = Comment.all

        @comments = @comments.sort do |comment, other_comment|
            other_comment.updated_at <=> comment.updated_at
        end
    end
    
    
    def show
        @comment = Comment.find(params[:id])
    end
    
    
    def new
        @comment = Comment.new
    end

    
    def edit
        @comment = Comment.find(params[:id])
    end

    
    def create
        @comment = Comment.new(comment_params)    

        if @comment.save
            redirect_to @comment
        else
            render 'new'
        end
    end


    def update
        @comment = Comment.find(params[:id])

        if @comment.update(comment_params)
            redirect_to @comment
        else
            render 'edit'
        end
    end

    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy

        redirect_to comments_path
    end
    

    private
        def comment_params
            params.require(:comment).permit(:name, :comment)
        end
end
