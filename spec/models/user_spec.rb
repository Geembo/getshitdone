require 'spec_helper'

describe User do
  before do
    @user = User.new(email: "foo@getshitdone.com", password: "foobar")
  end
  
  subject { @user }

  it { should respond_to(:email) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should  ensure_length_of(:email).is_at_most(100) }

  it { should respond_to(:password_digest) }
  it { should_not allow_mass_assignment_of(:password_digest) }

  it { should respond_to(:password) }
  it { should validate_presence_of(:password) }
  it { should ensure_length_of(:password).is_at_least(6) }

  it { should have_many(:tasks).dependent(:destroy) }

  it { should be_valid }

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end               

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end      
    end
  end

end
