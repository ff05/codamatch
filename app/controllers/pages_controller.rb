class PagesController < ApplicationController


  def home
    @user = User.find(params[:id])
    @users = User.all
    @user_matches = Match.get_matches_by_student(@user)
    @matches = Match.all
  end

end
