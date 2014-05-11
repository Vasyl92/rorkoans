class UsersController < ApplicationController

  def registration
  	@user = User.new
  end

  def login
  	@user = User.new
  end

  def profile
  end

  def all
  end

 def create
 	@user = User.new(params[:user])    
    if @user.save
      redirect_to root_path
    else
      render 'users/registration'
    end
 	
 end

end
