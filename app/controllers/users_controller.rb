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
                    address: params[:address],
                    role: params[:role])
    if user.save
      render plain: "succesful"
    else
      render plain: "error"
    end
  end
end
