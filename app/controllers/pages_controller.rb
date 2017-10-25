class PagesController < ApplicationController
  def home
    @users = User.all
    @matches = Match.all
  end

end
