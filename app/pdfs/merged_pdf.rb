# With this, I will create the pdf with photo and texts
# and then merge it with the other pdfs!
# https://www.google.fr/url?sa=t&rct=j&q=&esrc=s&source=web&cd=11&cad=rja&uact=8&ved=0ahUKEwjL6dv5gPbSAhWFlxoKHQZlBc8QFghTMAo&url=https%3A%2F%2Fwww.sitepoint.com%2Fpdf-generation-rails%2F&usg=AFQjCNGwKU2P02iigmii-NLa6mqYNxqR9w&sig2=ZTtiCBaxvTZeFfBFQVT_Yw
# http://prawnpdf.org/manual.pdf
# for images: http://stackoverflow.com/questions/11560455/prawn-import-image-from-url

require 'open-uri'

class MergedPdf < Prawn::Document

  def initialize(interview, user)
      super()
      @interview = interview
      @user = user
    end

  def generate
    # I put here the logos and the text "en partenariat..."
    y_position = cursor - 30
    image 'app/assets/images/Garantme-logo-black.png', width: 200, height: 40, :position => :left
    # text_box "Garantme en partenariat avec Axa",
    # :at => [70, y_position], :width => 200, size: 10, style: :bold
    # image 'app/assets/images/axa_logo.png', width: 60, height: 60, :position => :center, :vposition => 0

    move_down 60
    # I go a bit below and put the title
    y_position = cursor + 10
    draw_text "Fiche de candidature locative", size: 25, style: :bold, :color => '005B66', :at => [100, y_position]

    move_down 30

    # Pic
    y_position = cursor
    if @user.photo
      image (open ('http://res.cloudinary.com/di7e0fdiq/image/upload/' + @user.photo.path)), width: 100, height: 100, :position => :left
    else
      image (open @user.linkedin_picture_url), width: 100, height: 100, :position => :left
    end
    # I create a text box to put the main text
    text_box "Bonjour," + "\n#{Prawn::Text::NBSP }" + "\n#{Prawn::Text::NBSP }" + "Etudiant de #{Organisation.find(@user.organisation_id).name
    }, " + "je suis à la recherche d'une location. J'espère avoir l'occasion de vous rencontrer, n'hésitez pas à me contacter. Vous trouverez dans ce document mon certificat de scolarité, une preuve de revenue ainsi que mes papiers d'identité." +
    "\n#{Prawn::Text::NBSP }" + "\n#{Prawn::Text::NBSP }" + @user.first_name + ' ' + @user.last_name +
    "\n#{Prawn::Text::NBSP }" + "\n#{Prawn::Text::NBSP }" + 'Mon email: ' + @user.email +
    "\n#{Prawn::Text::NBSP }" + 'Mon numéro de téléphone: ' + @user.phone_number,
    :at => [130, y_position], :width => 400, size: 12, style: :bold, :align => :justify
  end
end
