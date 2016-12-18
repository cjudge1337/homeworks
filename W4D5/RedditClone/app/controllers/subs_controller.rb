class SubsController < ApplicationController
  before_action :ensure_logged_in_user
  before_action :ensure_moderator, only: [:edit, :destroy, :update]

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @subject = Sub.new
    render :new
  end

  def create
    subject = Sub.new(sub_params)
    if subject.save!
      redirect_to subs_url
    else
      flash.now[:errors] = subject.errors.full_messages
      render :new
    end
  end

  def edit
    @subject = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    subject = Sub.find_by(id: params[:id])
    if subject.update(sub_params)
      redirect_to sub_url(subject)
    else
      flash[:errors] = subject.errors.full_messages
      redirect_to edit_sub_url(subject)
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])

  end

  def destroy
    subject = Sub.find_by(id: params[:id])
    if subject.destroy
      redirect_to subs_url
    else
      flash.now[:errors] = subject.errors.full_messages
      render :index
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description, :user_id)
  end

  def ensure_moderator
    subject = Sub.find_by(id: params[:id])
    unless current_user.is_moderator?(subject)
      flash[:errors] = ["YOU ARE NOT AUTHORIZED"]
      redirect_to subs_url
    end
  end
end
