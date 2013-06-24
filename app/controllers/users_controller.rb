class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # automatically auth on create
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      # send to their profile page
      redirect_to @user
    else
      render 'new'
    end
  end
end
