class App::UsersController < App::ApplicationController
  before_action :fetch_user, only: [:show]

  # GET /users/:username
  def show
  end

  # GET /users
  def index
    @users = User.all
  end

protected

  def fetch_user
    @user = User.where(username: params[:id]).first!
  end
end
