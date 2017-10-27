class MatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @matches = Match.all
    render status: 200, json: @matches
  end
end
