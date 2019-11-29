class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    posts = Post.all
    render json: { data: posts }
  end

  def show
    render json: { data: @post }
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: { status: 'OK', data: post }
    else
      render json: { status: 'NG' }
    end
  end

  def update
    if @post.update(post_params)
      render json: { status: 'OK', data: @post }
    else
      render json: { status: 'NG' }
    end
  end

  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
