class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to users_menu_path(id: 0)
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to root_path
  end
end
