class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username],
                                    params[:user][:password])
    if user
      login_user(user)
    else
      flash.now[:errors] = ["Invalid login credentials"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
