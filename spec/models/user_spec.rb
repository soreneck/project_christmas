# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :name => "Me", :email => "me@example.com"  }
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
end

