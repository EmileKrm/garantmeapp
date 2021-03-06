require 'open-uri'
require 'combine_pdf'
require 'net/http'
require 'securerandom'

class InterviewsController < ApplicationController
before_action :set_interview, only: [:show, :edit, :update, :edit_later, :create_pdf, :update_later]

  def show
    respond_to do |format|
      format.html do
        @interview = Interview.find(params[:id])
        @user= current_user
        @messages = Message.where({sender_id: @user}).or(Message.where({receiver_id: @user}))
      end
      format.pdf do
        # if @interview.combined_pdf
        #   # raise
        #   redirect_to ('http://res.cloudinary.com/di7e0fdiq/image/upload/' + @interview.combined_pdf.path)
        #   # send_data @interview.combined_pdf, filename: "#{@interview.user.first_name}_#{@interview.user.last_name}", type: 'application/pdf'
        # else
          @user = @interview.user

          # Here, I generate the first part of the pdf, with pictures, text, etc with Prawn
          prawn_pdf = MergedPdf.new(@interview, @user)
          prawn_pdf.generate
          pdf_data = prawn_pdf.render # Import PDF data from Prawn
          prawn_pdf_converted = CombinePDF.parse(pdf_data)

          pdf = CombinePDF.new
          # Here, I add to the merged pdf the pdf created with prawn in the first part
          pdf << prawn_pdf_converted

          # Here I combine the attachements that are already pdf
          pdf1 = CombinePDF.parse Net::HTTP.get_response(URI.parse('http://res.cloudinary.com/di7e0fdiq/image/upload/' + @interview.proof_of_revenue.path)).body
          pdf2 = CombinePDF.parse Net::HTTP.get_response(URI.parse('http://res.cloudinary.com/di7e0fdiq/image/upload/' + @interview.school_certificate.path)).body
          pdf3 = CombinePDF.parse Net::HTTP.get_response(URI.parse('http://res.cloudinary.com/di7e0fdiq/image/upload/' + @interview.id_card.path)).body

          pdf << pdf3
          pdf << pdf2
          pdf << pdf1

          # Now that the pdf is created, I save it, upload it to cloudinary, and attach it to my model with attachinary
          key = SecureRandom.hex

          file_name = "#{@user.first_name}_#{@user.last_name}_#{key}.pdf"
          pdf.save file_name

          Cloudinary::Uploader.upload(file_name, :public_id => key)
          # then I need to associate the URL of that picture with the instance @interview
          url = 'http://res.cloudinary.com/di7e0fdiq/image/upload/' + key
          @interview.combined_pdf_url = url

          # redirect_to url

          # Here I need to render the full pdf
          send_data pdf.to_pdf, filename: file_name, type: 'application/pdf'
        # end
      end
    end
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

  def update_later
    @user = @interview.user
    @interview.update_later(interview_params)
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
  end

  def found_apartment
    @interview.has_found_apartment = true
  end

  def update
    @user = @interview.user
    @interview.update(interview_params)
    @interview.update(documents_submitted: true) if (@interview.id_card && @interview.school_certificate && @interview.proof_of_revenue)
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
    # @user = @interview.user
    # pdf = CombinePDF.new
    # pdf1 = CombinePDF.parse Net::HTTP.get_response(URI.parse('http://res.cloudinary.com/di7e0fdiq/image/upload/' + @interview.proof_of_revenue.path)).body
    # pdf2 = CombinePDF.parse Net::HTTP.get_response(URI.parse('http://res.cloudinary.com/di7e0fdiq/image/upload/' + @interview.school_certificate.path)).body
    # pdf << pdf1
    # pdf << pdf2
    # I will put the 3rd pdf coming from prawn here
    # key = SecureRandom.base64
    # file_name = "#{@user.first_name}_#{@user.last_name}_key.pdf"
    # pdf.save file_name

    # Cloudinary::Uploader.upload(file_name, :public_id => key)
    # # then I need to associate the URL of that picture with the instance @interview
    # url = 'http://res.cloudinary.com/di7e0fdiq/image/upload/' + key
    # @interview.combined_pdf_url = url
    redirect_to url
  end

  private

  def set_interview
    @interview = Interview.find(params[:id])
    authorize @interview
  end

  def interview_params
    params[:interview].nil? ? params.permit(:has_found_apartment, :has_a_cosigner, :professional_status, :interview_completed) : params.require(:interview).permit(:has_found_apartment, :arrondissement, :id_card, :address, :landlord_email, :monthly_rent, :monthly_budget, :move_in_date, :monthly_income, :has_a_cosigner, :organisation_id, :agreement_signed, :proof_of_revenue, :school_certificate, :professional_status, :job_title, :work_place, :landlord_phone, :landlord_email, :appartment_address, :unique_signator, :city, :cosigner_first_name, :cosigner_last_name, :cosigner_address, :cosigner_monthly_income, :cosigner_phone, :cosigner_email)
  end

end

# stepper form: having one div per question that will be hidden or not accordingly
# having a class that we need to design for each non answered question
# Having a class for each answered question
# with AJAX, I will handle the movements on the page
