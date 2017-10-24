require 'rails_helper'
require 'spec_helper'

feature "Create a user", js: true do

  let!(:user) { create :user, email: "jojo@gmail.com", password: "123456789" }

  scenario "Show the user email" do

    visit root_path(users/sign_in)

    fill_in 'user_email', with: 'jojo@gmail.com'
    fill_in 'user_password', with: '123456789'
    click_on('Log in')

    expect(page).to have_content('jojo@gmail.com')

  end

end
