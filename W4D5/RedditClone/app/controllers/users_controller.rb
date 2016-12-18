class UsersController < ApplicationController
  def new
    render :new
  end

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      login_user(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
end
