class InterviewsController < ApplicationController
before_action :set_interview, only: [:show, :edit]

  def new
    @interview = Interview.new
    authorize @interview
  end

  def create
    raise
    authorize @interview
  end

  def show

  end

  private

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:product).permit(:id_card)
  end
end

# stepper form: having one div per question that will be hidden or not accordingly
# having a class that we need to design for each non answered question
# Having a class for each answered question
# with AJAX, I will handle the movements on the page
