class UsersController < ApplicationController
  include ApplicationHelper
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def new
    @user = User.new
    @title = sign_up_title
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to #{base_title}!"
      redirect_to @user
    else
      @title = sign_up_title
      render 'new'
    end
  end

  private
  
  def sign_up_title
    "Sign up"
  end

end
