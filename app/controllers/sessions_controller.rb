class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # session[:current_user_id] = user.id
      redirect_to "/todos"
    else
      redirect_to "/"
    end
  end

  def new
  end
end
