class UsersController < ApplicationController
  before_action :set_user
  def edit
  end

  def update
    @user.update(user_params)
     render 'interviews/update'
    @interview = @user.interviews.last
    # redirect_to interview_path(@interview)
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :first_name, :last_name,
      :phone_number, :date_of_birth, :home_address, :organisation_id, :is_manager,
      :provider, :uid, :linkedin_picture_url, :photo)
  end
end
