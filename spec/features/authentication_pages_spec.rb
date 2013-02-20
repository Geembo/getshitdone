require 'spec_helper'

describe "AuthenticationPages" do
  
  subject { page }

  describe "login page" do
    before { visit login_path }

    it { should have_selector('h1', text: 'Login') }

    describe "visiting root without being logged in" do 
      it { should have_selector('h1', text: 'Login') }
    end

    describe "login" do
      before { visit login_path }

      describe "with invalid credentials" do
        click_button "Login"
        it { should have_selector('h1', text: 'Login') }
      end

      describe "with valid credentials" do
        let(:user) { FactoryGirl.create(:user) }
        before do
          fill_in "Email", with: user.email
          fill_in "Password", with: user.password
          click_button "Login"
        end
        it { should have_link('Logout', href: logout_path) }
      end
    end
  end
end
 