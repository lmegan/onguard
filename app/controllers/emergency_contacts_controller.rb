class EmergencyContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @emergencycontacts = EmergencyContact.all
  end

  def show
    @emergencycontact = EmergencyContact.find(params[:id])
  end

  def new
    @emergencycontact = EmergencyContact.new
  end

  def create
    @emergencycontact = Emergencycontact.new(emcon_params)
    if @emergencycontact.save
      redirect_to @emergencycontact, notice: 'Successfully created a new emergency contact.'
    else
      render :new
    end
  end

  def edit
    @emergencycontact = Emergencycontact.find(params[:id])
  end

  def update
    if @emergencycontact.update(emcon_params)
      redirect_to emergencycontact_path(@emergencycontact)
    else
      render :edit
    end
  end

  def destroy
    @emergencycontact = Emergencycontact.find(params[:id])
    if @emergencycontact.destroy
      redirect_to @emergencycontact, notice: 'Successfully deleted a new emergency contact.'
    end
  end

end

  private

    def emcon_params
      params.require(:emergencycontact).permit(:first_name, :last_name, :phone_number)
    end
end
