require 'open-uri'
require 'combine_pdf'
require 'net/http'
require 'securerandom'

class InterviewsController < ApplicationController
before_action :set_interview, only: [:show, :edit, :update, :edit_later, :create_pdf]

  def show
    @interview = Interview.find(params[:id])
    @user= current_user
    @messages = Message.where({sender_id: @user}).or(Message.where({receiver_id: @user}))
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

  def edit_later
    @user = @interview.user
  end

  def found_apartment
    @interview.has_found_apartment = true
  end

  def update
    @user = @interview.user
    @interview.update(interview_params)
    if @interview.save
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

    if interview_params[:organisation_id]
      @user.organisation_id = interview_params[:organisation_id]
      @user.save
    end
  end

  def create_pdf
    # see link below for doc of the combine pdf gem
    # https://github.com/boazsegev/combine_pdf/blob/master/README.md
    @user = @interview.user
    pdf = CombinePDF.new
    # photo = CombinePDF.parse Net::HTTP.get_response(URI.parse('http://res.cloudinary.com/di7e0fdiq/image/upload/' + @interview.id_card.path)).body
    pdf1 = CombinePDF.parse Net::HTTP.get_response(URI.parse('http://res.cloudinary.com/di7e0fdiq/image/upload/' + @interview.proof_of_revenue.path)).body
    pdf2 = CombinePDF.parse Net::HTTP.get_response(URI.parse('http://res.cloudinary.com/di7e0fdiq/image/upload/' + @interview.school_certificate.path)).body
    # pdf << photo
    pdf << pdf1
    pdf << pdf2
    key = SecureRandom.base64
    file_name = "#{@user.first_name}_#{@user.last_name}_key.pdf"
    pdf.save file_name

    pdf = MergedPdf.new(@interview, @user, file_name)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'

    Cloudinary::Uploader.upload(file_name, :public_id => key)
    # everything is working until here, left to do is associate it with the model
    # then I need to associate the URL of that picture with the instance @interview
    url = 'http://res.cloudinary.com/di7e0fdiq/image/upload/' + key
    @interview.combined_pdf_url = url




    redirect_to url
  end

  private

  def set_interview
    @interview = Interview.find(params[:id])
    authorize @interview
  end

  def interview_params
    params[:interview].nil? ? params.permit(:has_found_apartment, :professional_status, :interview_completed) : params.require(:interview).permit(:has_found_apartment, :arrondissement, :id_card, :address, :landlord_email, :monthly_rent, :monthly_budget, :move_in_date, :monthly_income, :has_a_cosigner, :organisation_id, :agreement_signed, :proof_of_revenue, :school_certificate)
  end

end

# stepper form: having one div per question that will be hidden or not accordingly
# having a class that we need to design for each non answered question
# Having a class for each answered question
# with AJAX, I will handle the movements on the page
