class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(params[:post])
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(params.require(:post))
		
		if @post.valid?
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	def edit
	  @post = Post.find(params[:id])
	end
end
