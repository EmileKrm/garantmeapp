class UsersController < ApplicationController
  before_action :set_user
  def edit
  end

  def update
    # @user.update(user_params) deleted because it was updating the model twice
    @interview = @user.interviews.last

    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to interview_path(@interview) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to interview_path(@interview)}
        format.js  # <-- idem
      end
    end
  end

  def update_later
    # @user.update(user_params) deleted because it was updating the model twice
    @interview = @user.interviews.last

    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to interview_path(@interview) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to interview_path(@interview)}
        format.js  # <-- idem
      end
    end
  end



  private

  def update_data
    # @user.update(user_params)
    @interview = @user.interviews.last

    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to interview_path(@interview) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to interview_path(@interview)}
        format.js  # <-- idem
      end
    end
  end

  def set_user
    @user = current_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :first_name, :last_name,
      :phone_number, :date_of_birth, :home_address, :organisation_id, :is_manager,
      :provider, :uid, :linkedin_picture_url, :photo, :photo_cache)
  end
end
