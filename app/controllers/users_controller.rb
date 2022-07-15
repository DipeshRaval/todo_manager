class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token
  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    redirect_to "/"
  end

  def login
    email = params[:email]
    password = params[:password]
    render plain: User.exists?(["email = ? and password = ?", email, password])
  end

  def new
    render "new"
  end
end
