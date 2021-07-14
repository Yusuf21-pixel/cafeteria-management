class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :ensure_user_logged_in

  def ensure_user_logged_in
    unless current_user
      redirect_to root_path
    end
  end

  def ensure_owner
    unless current_user.role == "owner"
      render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end

  def ensure_clerk
    unless current_user.role == "clerk"
      render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end

  def ensure_not_owner
    if current_user.role == "owner"
      render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end

  def ensure_customer
    unless current_user.role == "customer"
      render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end

  def ensure_not_user
    if current_user.role == "customer"
      render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end

  def ensure_not_clerk
    if current_user.role == "clerk"
      render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end

  def current_user
    return @current_user if @current_user

    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end
end
