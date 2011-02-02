class CommentsController < ApplicationController

before_filter :authenticate, :only => :destroy

	def create
		@post = Post.find(params[:id])
		@comment = @post.comment.create(params[:comment])
		redirect_to post_path(@post)
	end

	def delete
        @post = Post.find(params[:id])
		@comment = @post.comment.find(params[:comment])
        @comment.destroy
		redirect_to post_path(@post)
	end
end
