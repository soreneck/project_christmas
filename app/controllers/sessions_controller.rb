class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create
    if User.authenticate(params[:session][:email], params[:session][:password]).nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      
    end
  end
  
  def destroy
    
  end

end
