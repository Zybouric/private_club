class RegistrationsController < ApplicationController
before_action  :set_registration, only: [:show, :edit, :update, :destroy]

  def index
    @registrations = Registration.all
  end


  def show
      current_user
  end

  def new
    @registration = Registration.new
  end

  def edit
        @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)

    respond_to do |format|
      if @registration.save
        format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registrations_url, notice: 'Registration was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:first_name, :last_name, :email, :password)
    end
end
