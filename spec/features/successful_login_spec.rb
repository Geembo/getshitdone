require 'spec_helper'

feature "Login Success" do
  scenario "user gives valid credentials" do
    user = FactoryGirl.create(:user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Login"
    current_path.should eq(root_path)
  end
end