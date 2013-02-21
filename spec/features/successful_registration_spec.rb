require 'spec_helper'

feature "Successful registration" do

  scenario "user gives valid information" do
    visit register_path
    fill_in "Email", with: "wat@wat.com"
    fill_in "Password", with: "a" * 6
    click_button "Register"
    current_path.should eq(root_path)
  end
  
end