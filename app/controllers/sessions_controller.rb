class SessionsController < ApplicationController
#  before_action :set_session, only: [:new, :create, :destroy]

  def new 
    render 'new'
  end
 
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
    else
     flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end