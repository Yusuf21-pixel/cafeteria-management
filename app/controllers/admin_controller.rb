class AdminController < ApplicationController
  def index
  end

  def reports
  end

  def users_profile
    @users = User.all.order(:id)
  end

  def update_special_users_view
    @id = params[:id]
    @user = User.find(@id)
  end

  def edit_special_users
    user = User.find(params[:id])
    user.name = params[:name]
    user.phone_no = params[:phone_no]
    user.email = params[:email]
    user.save!
    redirect_to users_profile_path
  end

  def invoices
    @orders = Order.all
    unless params[:first_date].nil?
      @orders = Order.date_range(params[:first_date].to_date, params[:last_date].to_date)
    end
  end

  def customers_profile_view
  end

  def customer_report
  end
end
