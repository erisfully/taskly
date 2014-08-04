require 'rails_helper'
require 'capybara/rails'

feature 'Task lists' do

  scenario 'User can view task lists' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")

   end

    scenario "User can add new task lists" do
      create_user email: "user@example.com"

      visit signin_path
      click_on "Login"
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      click_on "Login"

    click_on "+ Add Task List"

    expect(page).to have_field("Name")
    fill_in "Name", with: "Study"
    click_on"Save Task list"

    expect(page).to have_content "Study"
  end

end