require 'spec_helper'

feature "Failed Login" do

  scenario "should see Login button" do
    visit login_path
    click_button "Login"
    page.should have_selector('input', 'Login')
  end

  scenario "should see Register link" do
    visit login_path
    click_button "Login"
    page.should have_link('Register')
  end
  
end
