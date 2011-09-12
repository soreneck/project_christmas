class UsersController < ApplicationController
  include ApplicationHelper
  
  before_filter :authenticate, :only => [:index, :show, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end
  
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
      sign_in @user
      flash[:success] = "Welcome to #{base_title}!"
      redirect_to @user
    else
      @title = sign_up_title
      render 'new'
    end
  end

  def edit
    # @user = User.find(params[:id]) because of before_filter :correct_user
    @title = "Edit user"
  end

  def update
    # @user = User.find(params[:id]) because of before_filter :correct_user
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  private
  
  def sign_up_title
    "Sign up"
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

end
