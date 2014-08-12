require 'rails_helper'
require 'capybara/rails'
require 'launchy'

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
    fill_in "Name", with: ""
    click_on"Save Task List"

    expect(page).to have_content "Your task list could not be created"

    fill_in "Name", with: "School"
    click_on "Save Task List"

    expect(page).to have_content "Task List was created successfully!"

    page.first(:link, "Edit").click

    expect(page).to have_field "Name", with: "School"
    fill_in "Name", with: "gSchool"
    click_on "Edit Task List"

    expect(page).to have_content "Task List was updated successfully!"
    expect(page).to have_content "gSchool"

    end

  scenario "User can add and delete a task" do
    create_user email: "user@example.com"

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "+ Add Task List"

    fill_in "Name", with: "gSchool"
    click_on "Save Task List"

    click_on "+ Add Task"

    fill_in "Task", with: "code"
    select "2015", from: "task_date_1i"
    select "August", from: "task_date_2i"
    select "27", from: "task_date_3i"

    click_on "Create Task"

    expect(page).to have_content "Task was created successfully!"
    expect(page).to have_content "code"
    expect(page).to have_content "2015-08-27"


    click_on "+ Add Task"


    click_on "Create Task"

    expect(page).to have_content "Your task could not be created"

    visit root_path

    within ".tasks" do
    click_on "Delete"
    end
    
    expect(page).to_not have_content("code")
    expect(page).to have_content("Task was deleted successfully!")

    click_on "+ Add Task"

    fill_in "Task", with: "code"
    select "2015", from: "task_date_1i"
    select "August", from: "task_date_2i"
    select "27", from: "task_date_3i"
    click_on "Create Task"

    click_on "+ Add Task List"

    fill_in "Name", with: "Home"
    click_on "Save Task List"

    click_on "gSchool"

    expect(page).to_not have_content("Home")
    expect(page).to have_content("code")
    expect(page).to have_content "2015-08-27"
  end

  scenario "User can complete tasks" do
    create_user email: "user@example.com"

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "+ Add Task List"

    fill_in "Name", with: "gSchool"
    click_on "Save Task List"

    click_on "+ Add Task"

    fill_in "Task", with: "code"

    click_on "Create Task"

    expect(page).to have_content "code"

    click_on "Complete"
    expect(page).to_not have_content "code"

    click_on "Completed"
    expect(page).to have_content "code"
  end

  scenario "tasks show up in chronological order" do
    create_user email: "user@example.com"

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "+ Add Task List"

    fill_in "Name", with: "gSchool"
    click_on "Save Task List"

    click_on "+ Add Task"

    fill_in "Task", with: "code"
    select "2015", from: "task_date_1i"
    select "August", from: "task_date_2i"
    select "27", from: "task_date_3i"

    click_on "Create Task"

    click_on "+ Add Task"

    fill_in "Task", with: "read"
    select "2016", from: "task_date_1i"
    select "August", from: "task_date_2i"
    select "2", from: "task_date_3i"

    click_on "Create Task"

    expect(page).to have_content "code - 2015-08-27 Delete Complete read - 2016-08-02"
  end


  #to delete task list: page.first(:link, "Delete").click
end