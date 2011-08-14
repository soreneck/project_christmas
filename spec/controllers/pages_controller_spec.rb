require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "Project Christmas"
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should display home on title" do
      get 'home'
      response.should have_selector("title", :content => "#{@base_title} | Home")
    end    
    
    it "should have a non blank body" do
      get 'home'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    
    it "should display about on title" do
      get 'about'
      response.should have_selector("title", :content => "#{@base_title} | About")
    end    
    
    it "should have a non blank body" do
      get 'about'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    
    it "should display about on title" do
      get 'contact'
      response.should have_selector("title", :content => "#{@base_title} | Contact")
    end  
    
    it "should have a non blank body" do
      get 'contact'
      response.body.should_not =~ /<body>\s*<\/body>/
    end  
  end

end
