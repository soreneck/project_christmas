require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new'
      # have_selector does a contain "Sign up" in title
      response.should have_selector("title", :content => "Sign up")
    end
  end

end
