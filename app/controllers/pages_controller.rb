class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contact, :team ]
  def home
  end

  def contact
  end

  def team
  end

end
