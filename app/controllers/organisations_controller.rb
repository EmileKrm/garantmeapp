class OrganisationsController < ApplicationController
  before_action :set_organisation
  before_action :get_current_user, only: [:create, :update]

  def index
    @organisations = policy_scope(Organisation).order(created_at: :desc)
    @interviews = Interview.where(["organisation_id = :organisation", { organisation: @organisation.id }])
    p @interviews
  end

  def show
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def new
  end

  private

  def get_current_user
    @user = current_user
  end

  def set_organisation
    @organisation = current_user.organisation
  end

end
