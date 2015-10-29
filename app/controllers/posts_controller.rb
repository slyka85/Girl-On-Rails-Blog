class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
	end

	def show
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "Updated article!"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post, notice: "Post Saved"
		else
			render 'new', notice: "Post NOT saved"
		end
	end


	private
	def post_params
		params.require(:post).permit(:title, :content, :slug, :image_link)
	end




	def find_post
		@post = Post.friendly.find(params[:id])
	end
end
