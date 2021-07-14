class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in, except: [:destroy]

  def new
    if current_user
      if current_user.role == "customer"
        redirect_to users_menu_path(id: 0)
      elsif current_user.role == "owner"
        redirect_to admin_index_path
      else
        redirect_to users_menu_path(id: 0)
      end
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if (user.role == "owner")
        session[:current_user_id] = user.id
        redirect_to admin_index_path
      elsif user.role == "clerk"
        if user.archived_by
          flash[:error] = "Your account is deleted"
          redirect_to root_path
        else
          session[:current_user_id] = user.id
          redirect_to users_menu_path(id: 0)
        end
      else
        session[:current_user_id] = user.id
        redirect_to users_menu_path(id: 0)
      end
    else
      flash[:error] = "Your login attempt was invalid. Please retry."
      redirect_to root_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to root_path
  end
end
