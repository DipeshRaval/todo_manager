class UsersController < ApplicationController
  skip_before_action :ensure_user_logeed_in
  # skip_before_action :verify_authenticity_token

  def index
    # render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
    render plain: "404 Not Found"
  end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    if new_user.save
      # flash[:error] = "You're signed-up succesfully now please sign-in tp continue"
      # redirect_to "/"

      session[:current_user_id] = new_user.id
      redirect_to todos_path
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def login
    email = params[:email]
    password = params[:password]
    render plain: User.exists?(["email = ? and password = ?", email, password])
  end

  def new
  end
end
