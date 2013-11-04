module App
  class UsersController < AppController
    before_action :fetch_user, only: [:show]

    # GET /users/:username
    def show
    end

  protected

    def fetch_user
      @user = User.find_by_username(params[:username])
      redirect_to root_url unless @user
    end

  end
end
