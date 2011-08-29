# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#

require 'spec_helper'

describe User do

  before(:each) do
    @attr = { 
      :name => "Me", 
      :email => "me@example.com",
      :password => "password",
      :password_confirmation => "password"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should accept name that is just right" do
    long_name = "a" * 150
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should be_valid
  end
  
  it "should reject name that is too long - 200 max" do
    long_name = "a" * 201
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com USER_ME@for.bar.org first.last@foo.my]
    addresses.each { |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    }
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com USER_ME_for.bar.org first.last@foo.]
    addresses.each { |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    }    
  end

  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  describe "password validations" do
    
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
      should_not be_valid
    end
    
    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "another_password")).
      should_not be_valid
    end
    
    it "should reject short passwords" do
      short = "a" * 5
      User.new(merge_passwords short).should_not be_valid
    end
    
    it "should reject long passwords" do
      long = "a" * 41
      User.new(merge_passwords long).should_not be_valid
    end
  end
  
  describe "password encryption" do
    
    before(:each) do
      @user = User. create!(@attr)
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
    
    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end
    
    describe "has_password? method" do
      
      it "should be true if passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end
      
      it "should be false if the password don't match" do
        @user.has_password?("invalid").should be_false
      end
    end
    
  end
end

def merge_passwords(password)
  @attr.merge(:password => password, :password_confirmation => password)
end
