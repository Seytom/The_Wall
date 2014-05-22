class UsersController < ApplicationController
  def index
  end

  def new
    #loads an object for use in the view form
    @user = User.new
  end

  def create
    #use strong params for security to create a new user
    new_user=User.new(user_params)
    if new_user.save      
      @success_message = "Registration successful."
      #now log in new user with helper function
      sign_in new_user
      redirect_to messages_path
    else
      @message = "Registration failed." 
      @explain = new_user.errors.full_messages
      @user = User.new
      render "new"
      return 
    end               
    
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,:email, :password, :password_confirmation)
  end

end
