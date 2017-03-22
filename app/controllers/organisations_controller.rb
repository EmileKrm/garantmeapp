class OrganisationsController < ApplicationController
  before_action :set_organisation
  before_action :get_current_user, only: [:create, :update]

  def index
    @organisations = policy_scope(Organisation)
    @interviews = helpers.fetch_interviews(params[:tab])
  end

  def show
    @student = User.find(params[:id])
    unless OrganisationPolicy.new(current_user, @organisation, @student).show?
      raise Pundit::NotAuthorizedError
    end
    skip_authorization
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
