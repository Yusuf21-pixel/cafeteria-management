class AdminController < ApplicationController
  before_action :ensure_owner
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
    @orders = Order.all.order(id: :desc)
    unless params[:first_date].nil?
      @orders = Order.date_range(params[:first_date].to_date, params[:last_date].to_date).order(id: :desc)
    end
  end

  def customers_profile_view
    @users = User.all.where("role = ?", "customer")
  end

  def customer_report
    @id = params[:id]
    user = User.find(@id)
    @orders = user.orders.order(id: :desc)
    unless params[:first_date].nil?
      @orders = @orders.date_range(params[:first_date].to_date, params[:last_date].to_date).order(id: :desc)
    end
  end
end
