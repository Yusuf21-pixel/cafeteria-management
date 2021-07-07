class AccessController < ApplicationController
  def access_control
    render plain: "hello"
  end
end
