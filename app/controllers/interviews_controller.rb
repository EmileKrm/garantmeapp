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
  @user= current_user
end

private

def set_interview
  @interview = Interview.find(params[:id])
  authorize @interview
end

end

# stepper form: having one div per question that will be hidden or not accordingly
# having a class that we need to design for each non answered question
# Having a class for each answered question
# with AJAX, I will handle the movements on the page
