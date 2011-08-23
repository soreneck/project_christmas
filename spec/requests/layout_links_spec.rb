require 'spec_helper'

describe "LayoutLinks" do
  
  it "should render Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end
  
  it "should render Contact page at /contact" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end
  
  it "should render About page at /about" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end  
  
  it "should have a sign up page at '/singup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
  
  it "should have the right links on layouts" do
    visit root_path
    response.should have_selector 'a[href="/"]>img'
    
    click_link 'Sign up now!'
    response.should have_selector('title', :content => 'Sign up')
    
    verifyLinkExist 'About'
    verifyLinkExist 'Contact'
  end
end

def verifyLinkExist(title)
  click_link title
  response.should have_selector('title', :content => title)
end