require 'pry'
class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find_by_id(params[:id])

	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params(title: params[:post][:title], description: params[:post][:description]))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(post_params(title: params[:post][:title], description: params[:post][:description]))
@post.save

	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private
		def post_params(*arg)
			params.require(:post).permit(:title, :description)

		end
end
