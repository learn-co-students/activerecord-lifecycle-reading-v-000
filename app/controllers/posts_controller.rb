class PostsController < ApplicationController
	belongs_to :author
	validate :is_title_case

	before_validation :make_title_case

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
	  @post = Post.new(params)
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(params.require(:post))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private

	def is_title_case
		if title.split.any?{|w|w[0.upcase != w[0]]}
			errors.add(:title, "Title must be in title case")
		end
	end

	def make_title_case
		self.title = self.title.titlecase
	end
end
