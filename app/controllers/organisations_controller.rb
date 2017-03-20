class OrganisationsController < ApplicationController
  before_action :get_current_user, only: [:create, :update]

  def index
    @organisations = policy_scope(Organisation)
    @interviews = Interview.where(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
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

  def set_or
    @or = Organisation.find(params[:id])
  end

end
