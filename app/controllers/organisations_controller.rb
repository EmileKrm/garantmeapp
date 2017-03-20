class OrganisationsController < ApplicationController
  def index
    @organisations = policy_scope(Organisation)
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
end
