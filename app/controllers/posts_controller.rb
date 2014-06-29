class PostsController < ApplicationController
	def index
		@category = Category.find(params[:id])
		@posts = Post.where(category: @category)		
	end

end
