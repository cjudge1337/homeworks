class PostsController < ApplicationController

  def new
    @post = Post.new
    render :new
  end

  def create
    # fail

    post = Post.new(post_params)
    # debugger
    # ActiveRecord::Base.transaction do
    post.sub_ids = params[:post][:sub_ids]
      if post.save!
        # post_params[:post][:sub_ids].each do |sub_id|
        #   PostSub.create!(sub_id: sub_id, post_id: post.id)
        # end
        redirect_to sub_url(post.subs.first)
      else
        flash.now[:errors] = post.errors.full_messages
        render :new
      end
    # end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def update
    post = Post.find_by(id: params[:id])
    if post.update(post_params)
      redirect_to post_url(post)
    else
      flash[:errors] = post.errors.full_messages
      redirect_to edit_post_url(post)
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    post = Post.find_by(id: params[:id])
    if post.destroy
      redirect_to sub_url(post.subject)
    else
      flash.now[:errors] = post.errors.full_messages
      redirect_to subs_url
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id, sub_ids: [])
  end

  # def ensure_moderator
  #   post = Post.find_by(id: params[:id])
  #   unless current_user.is_moderator?(post)
  #     flash[:errors] = ["YOU ARE NOT AUTHORIZED"]
  #     redirect_to subs_url
  #   end
  # end
end
