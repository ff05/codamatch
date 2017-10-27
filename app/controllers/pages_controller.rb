class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @date_today = Match::FIRST_DATE + 2.days

    @users = User.all
    @user = current_user.id unless !current_user

    @matches_for_user = Match.matches_per_user(@user)
    @matches = Match.get_matches
    @match_today = @matches_for_user.match_today(@date_today)
    @previous_matches = @matches_for_user.get_previous_matches(@date_today)

    @other_name = Match.get_user_by_id(@match_today).pluck :name
    @dates = @matches.pluck :date
    @user_name = User.get_name(current_user.id) unless !current_user

    @matches_today = Match.get_matches_by_date(@date_today)
  end

  def matches
    @matches = Match.all
  end

end
