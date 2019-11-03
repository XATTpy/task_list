class CommentsController < ApplicationController
    before_action :find_commentable
    before_action :set_comment, only: [:edit, :update, :destroy]

    def new
      @comment = Comment.new
    end

    def create
      @comment = @commentable.comments.new comment_params

      if @comment.save
        redirect_back fallback_location: root_path, notice: 'Your comment was successfully posted!'
      else
        redirect_back fallback_location: root_path, notice: "Your comment wasn't posted!"
      end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @comment.destroy
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully destroyed.' }
      end
    end

    private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:commenter, :text)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Task.find_by_id(params[:task_id]) if params[:task_id]
    end
end
