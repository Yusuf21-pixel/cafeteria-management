class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :current_user

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
