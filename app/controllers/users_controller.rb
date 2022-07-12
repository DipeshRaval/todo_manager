class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create(name: name, email: email, password: password)
    rendered_text = "The new user created with the id : #{new_user.id}"
    render plain: rendered_text
  end

  def login
    email = params[:email]
    password = params[:password]
    render plain: User.exists?(["email = ? and password = ?", email, password])
  end
end
