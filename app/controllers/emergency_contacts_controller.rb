class EmergencyContactsController < ApplicationController
  before_action :authenticate_user!


  def index
    @emergencycontacts = EmergencyContact.where(user: current_user)
  end

  def show
    @user = current_user
    @emergencycontact = EmergencyContact.find(params[:id])
  end

  def new
    @emergencycontact = EmergencyContact.new
    @user = current_user
  end

  def create
    @emergencycontact = EmergencyContact.new(emcon_params)
    @user = current_user
    @emergencycontact.user = @user
    if @emergencycontact.save
      redirect_to root_path, notice: 'Successfully created a new emergency contact.'
    else
      render :new
    end
  end

  def edit
    @emergencycontact = EmergencyContact.find(params[:id])
    @user = current_user
  end

  def update
    @emergencycontact = EmergencyContact.find(params[:id])
    if @emergencycontact.update(emcon_params)
      redirect_to root_path, notice: 'Successfully updtaed the emergency contact.'
    else
      render :edit
    end
  end

  def destroy
    @emergencycontact = EmergencyContact.find(params[:id])
    if @emergencycontact.destroy
      redirect_to emergency_contacts_path, notice: 'Successfully deleted a new emergency contact.'
    end
  end

end

  private

    def emcon_params
      params.require(:emergency_contact).permit(:first_name, :last_name, :phone_number)
    end


