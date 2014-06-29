class PostsController < ApplicationController
	
	def index
		@category = Category.find(params[:id])
		@posts = Post.where(category: @category)		
	end

	def show
		@post = Post.find(params[:id])
	end

end
