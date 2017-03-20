class OrganisationsController < ApplicationController
  before_action :set_organisation
  before_action :get_current_user, only: [:create, :update]

  def index
    @organisations = policy_scope(Organisation)

    @interviews = Interview.all


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
    p current_user
    @organisation = current_user.organisation
  end

end
