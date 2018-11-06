class SessionsController < ApplicationController
#  before_action :set_session, only: [:new, :create, :destroy]

  def new 
    render 'new'
  end
 
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
     flash[:danger] = 'Invalid email/password combination'
      render :'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url

  end
end