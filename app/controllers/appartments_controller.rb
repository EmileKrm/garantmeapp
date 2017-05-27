class AppartmentsController < ApplicationController
  before_action :set_appartment, only: [:new, :create]
  before_action :get_current_user, only: [:create, :update]

  def new
    @appartment = Appartment.new
    authorize @appartment
  end

  def create
    @apartment = Apartment.new(apartment_params)
    authorize @apartment
    @apartment.save
  end

  private

  def apartment_params
    params.require(:appartment).permit(:appartment_address, :rent, :landlord_email, :landlord_number)
  end
end
