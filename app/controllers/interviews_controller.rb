class InterviewsController < ApplicationController
before_action :set_interview, only: [:show, :edit, :update]

  def show
    @user= current_user
  end

  def new
    @interview = Interview.new(user: current_user, )
    authorize @interview
    @interview.save
    redirect_to edit_interview_path(@interview)
  end

  def create

  end

  def edit
    @user = @interview.user
  end

  def update
    @interview.update(interview_params)
    if @interview.save
      respond_to do |format|
        # format.html { redirect_to edit_interview_path(@interview) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        # format.html { redirect_to edit_interview_path(@interview)}
        format.js  # <-- idem
      end
    end
  end

  private

  def set_interview
    @interview = Interview.find(params[:id])
    authorize @interview
  end

  def interview_params
    params[:interview].nil? ? params.permit(:has_found_apartment) : params.require(:interview).permit(:has_found_apartment, :arrondissement, :id_card)
  end

end

# stepper form: having one div per question that will be hidden or not accordingly
# having a class that we need to design for each non answered question
# Having a class for each answered question
# with AJAX, I will handle the movements on the page
