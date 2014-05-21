class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
  	#The authenticate function comes from the User model at User.rb
  	#user=User.new
  	user = User.authenticate(params[:email], params[:password])
    if user.nil?
      flash[:error] = "Couldn't find a user with those credentials"
      #if there is an error, redirect back to login
      redirect_to sessions_path
    else
      sign_in user #helper function
      redirect_to messages_path
    end
  end

  def destroy
    #call to helper function to end session
    sign_out
    redirect_to root_path
  end
end
