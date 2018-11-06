class SessionsController < ApplicationController
#before_action :set_session, only: [:new, :create, :destroy]

  def new 
    render 'new'
  end
 
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user_path(user.id), success: 'You are now logged as #{@user.name}'
    else
     flash[:danger] = 'Invalid email/password combination'
      render :'new'
    end
  end

  def destroy
    log_out
    redirect_to users_path
  end
end