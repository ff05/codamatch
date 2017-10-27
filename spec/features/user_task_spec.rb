require 'rails_helper'

describe "User viewing its match" do
  before {login_as user}

  let!(:user) { create :user, email: "sammy@gmail.com" }

  it "show his/her match of the day" do
    visit root_url(user)

    expect(page).to have_text("Your match of today is")
  end

  it "See history of matches" do
    visit root_url(user)

    expect(page).to have_text("History of matches")
  end

end
