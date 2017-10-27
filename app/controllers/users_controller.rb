class UsersController < ApplicationController

  def index
    users = User.all
    render status: 200, json: users
  end

  def update
    @user = User.find(params[:id])
    # @user.toggle!(:admin)
    if @user.update(user_params)
      render status: 200, json: @user
    else
      render status: 422, json: {
        errors: @user.errors
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :password, :email, :admin)
  end
end
