# With this, I will create the pdf with photo and texts
# and then merge it with the other pdfs!

class MergedPdf < Prawn::Document

  def initialize(interview, user, file_name)
      super()
      @interview = interview
      @user = user
      @file_name
    end

  def header
      #This inserts an image in the pdf file and sets the size of the image
      image @user.photo, width: 530, height: 150
  end
end
