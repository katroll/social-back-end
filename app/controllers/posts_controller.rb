class PostsController < ApplicationController
  before_action :render_not_found_response, only: [:show, :update, :destroy]
  before_action :set_post, only: %i[ show update destroy ]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
      render json: @post, status: :created, location: @post
  end

  # PATCH/PUT /posts/1
  def update
    @post.update(post_params)
      render json: @post
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:content, :user_id)
    end
end
