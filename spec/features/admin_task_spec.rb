require 'rails_helper'

describe "Let admin see matches" do
  before { login_as user }
  let(:user) { create :user, email: "current@user.com", admin: true }

  it "let admin see matches of the day" do
    visit root_url(user)
    expect(page).to have_text("The matches for today are")
  end


  it "let admin see list of students" do
    visit root_url(user)
    expect(page).to have_text("List of all Users")
  end



end
