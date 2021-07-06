# users_controller.rb
class UsersController < ApplicationController
  def new
    render "new"
  end

  def create
    user = User.new(name: params[:name],
                    phone_no: params[:phone_no],
                    email: params[:email],
                    password: params[:password],
                    role: params[:role])
    if user.save
      session[:current_user_id] = user.id
      Cart.create!(user_id: user.id)
      redirect_to users_menu_path(id: 0)
    else
      redirect_to new_user_path
    end
  end
end
