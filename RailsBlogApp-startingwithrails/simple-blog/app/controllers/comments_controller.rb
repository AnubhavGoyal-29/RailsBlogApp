class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
                @comment = Comment.new(params[:comment].permit(:comment))
                @comment.post = @post
                @comment.user = current_user
                @comment.save
		redirect_to post_path(@post)	
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
end
