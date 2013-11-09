require 'test_helper'

class MasterIntegrationTest < ActionDispatch::IntegrationTest

  setup do
    visit login_path
    fill_in 'email', :with => users(:four).email
    fill_in 'password', :with => "password"
    click_button 'Log In'
  end

  test "Masters can log in" do

    assert page.has_content?("Logged in!")
  end

  test "Masters can't go to admin page" do
    visit admin_path

    assert page.has_content?("We're sorry, but something went wrong.")
  end

  test "Masters can see jobs.index link" do
    visit root_path

    assert page.has_content?("Jobs") 
  end

  test "Masters can't see edit jobs link" do
    visit jobs_path

    refute page.has_content?("Edit")
  end

  test "Masters can't edit jobs directly" do
    visit jobs_path

    refute page.has_content?("Edit")
  end

  test "Masters can see edit tasks link" do
    visit tasks_path

    assert page.has_content?("Edit")
  end

  test "Masters can edit their own tasks" do
    visit tasks_path
    elem = find('tr', text: 'task_1a')
    elem.find('a', text: "Edit").click

    assert page.has_content?("Editing task")
  end

  test "Masters cannot edit others' tasks" do
    visit tasks_path
    elem = find('tr', text: 'task_3')
    elem.find('a', text: "Edit").click

    refute page.has_content?("Editing task")
  end

  test "Masters can edit certain tasks" do
    visit tasks_path
    elem = find('tr', text: 'task_1a')
    elem.find('a', text: "Edit").click

    assert page.has_css?('input#task_percent_complete')
  end

  test "Masters can't edit certain tasks" do
    visit tasks_path
    elem = find('tr', text: 'task_1a')
    elem.find('a', text: "Edit").click

    refute page.has_css?('input#task_task_name')
  end


end
