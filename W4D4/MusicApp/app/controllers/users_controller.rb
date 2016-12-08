class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by(email: email)
    if @user.save
      login_user!
      #redirect_to
    else
      render :new
    end
  end

  def show

  end

end
