require 'spec_helper'

feature "Failed registration" do

  before do
    @user = FactoryGirl.create(:user)
  end

  scenario "fills in only mail" do
    visit register_path
    fill_in "Email", with: "el@page.page"
    click_button "Register"
    page.should have_selector('h4', "Some errors occured")
    page.should have_selector('input', "Register")
  end

  scenario "fills in with email of an existing user" do
    visit register_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "a"*15
    click_button "Register"
    page.should have_selector('h4', "Some errors occured")
    page.should have_selector('input', "Register")
  end
end
