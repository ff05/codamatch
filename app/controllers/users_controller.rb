class UserController < ApplicationController

  def update
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    
  end
end
