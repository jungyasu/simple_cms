class PostsController < ApplicationController
	layout 'public'
	def index
		@posts = Post.all
	end

	def new

	end

	def create
	end

	def edit
	end

	def update
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
	end
end
