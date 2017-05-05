class LeadsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def index
    @leads = Lead.all
  end

  def new
    @lead = Lead.new
    authorize @lead
  end

  def create
    @lead = Lead.new(lead_params)
    authorize @lead
    @lead.save
    redirect_to root_path
  end

  private

  def lead_params
    params.require(:lead).permit(:lead_first_name, :lead_email)
  end
end
