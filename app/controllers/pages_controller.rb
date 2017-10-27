class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @date_today = Date.today

    @users = User.all
    @user = current_user.id unless !current_user

    @matches_for_user = Match.matches_per_user(@user)
    @matches = Match.get_matches
    @match_today = @matches_for_user.match_today(@date_today).to_a
    @previous_matches = @matches_for_user.get_previous_matches(@date_today)

    @dates = @matches.pluck :date
    @user_name = User.get_name(current_user.id) unless !current_user

    @matches_today = Match.get_matches_by_date(@date_today)
    @get_other = get_other
  end

  def matches
    @matches = Match.all
  end

  def get_other
    own = @match_today.pluck :user_id
    s1 = @match_today.pluck :student1
    s2 = @match_today.pluck :student2
    if own == s1
      User.get_names(s1).join('')
    else
      User.get_names(s2).join('')
    end
  end

end
