require 'rails_helper'
require 'capybara/rails'

feature 'about page' do

  scenario 'user can view about page' do
    visit signin_path
    click_on "About"
    expect(page).to have_content "About Lorem ipsum"
  end
end