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
  
  it "should have a sign up page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
  
  it "should have a 'Sign up now!' link that works" do
    get '/'
    click_link 'Sign up now!' 
    response.should have_selector('title', :content => 'Sign up')
    response.should have_selector 'a[href="/"]>img' # logo links back to '/'
  end
  
  it "should have a sign in page at '/signin'" do
    get '/signin'
    response.should have_selector("title", :content => "Sign in")
  end
  
  it "should have the right links on layouts" do
    visit root_path
    verifyLinkWorks 'Sign in'
    verifyLinkWorks 'About'
    verifyLinkWorks 'Contact'
  end
end

def verifyLinkWorks(title)
  click_link title
  response.should have_selector('title', :content => title)
  response.should have_selector 'a[href="/"]>img' # logo links back to '/'
end