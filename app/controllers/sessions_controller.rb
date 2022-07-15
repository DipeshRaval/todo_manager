class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      redirect_to "/"
    else
      redirect_to "/todos"
    end
  end

  def new
  end
end
