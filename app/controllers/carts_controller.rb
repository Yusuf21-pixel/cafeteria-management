class CartsController < ApplicationController
  before_action :ensure_not_owner

  def index
  end
end
