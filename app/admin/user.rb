ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :first_name, :last_name, :phone_number,
  :date_of_birth, :home_address, :is_manager, :admin, :organisation_id, :interview_id,
  :linkedin_picture_url, :linkedin_first_name, :linkedin_last_name,
  :admin, :current_status, :organisation, :created_date, :date_of_birth,
  :home_address,:is_manager, :admin

  index do
    selectable_column
    column :id
    column "Last Interview n°" do |itw|
        unless itw.interviews.last.nil?
          link_to "#{itw.interviews.last.id}", admin_interview_path(itw.interviews.last)
        else
          " - "
        end
      end
    # user information
    column :first_name
    column :last_name
    column :email
    column :phone_number
    column :organisation
    column :move_in_date
    column :created_date
    column :date_of_birth
    column :home_address
    column "Professional Status" do |itw|
      "#{itw.interviews.last.professional_status}" unless itw.interviews.last.nil?
    end
    column "Job Title" do |itw|
      "#{itw.interviews.last.job_title}" unless itw.interviews.last.nil?
    end
    column "Work Place" do |itw|
      "#{itw.interviews.last.work_place}" unless itw.interviews.last.nil?
    end
    # interview information
    column "City" do |itw|
      "#{itw.interviews.last.city}" unless itw.interviews.last.nil?
    end
    column "Monthly Budget" do |itw|
      "#{itw.interviews.last.monthly_budget}" unless itw.interviews.last.nil?
    end
    column "Monthly Income" do |itw|
      "#{itw.interviews.last.monthly_income}" unless itw.interviews.last.nil?
    end
    column "Found Appartment?" do |itw|
      "#{itw.interviews.last.has_found_apartment}" unless itw.interviews.last.nil?
    end
    column "Arrondissement" do |itw|
      "#{itw.interviews.last.arrondissement}" unless itw.interviews.last.nil?
    end
    column "Address" do |itw|
      "#{itw.interviews.last.address}" unless itw.interviews.last.nil?
    end
    #appartment information
    # column "Appartment Address" do |itw|
    #   "#{itw.interviews.last.appartment_address}" unless itw.interviews.last.nil?
    # end
    column "Monthly Rent" do |itw|
      "#{itw.interviews.last.monthly_rent}" unless itw.interviews.last.nil?
    end
    column "Landlord Email" do |itw|
      "#{itw.interviews.last.landlord_email}" unless itw.interviews.last.nil?
    end
    column "Landlord Phone" do |itw|
      "#{itw.interviews.last.landlord_phone}" unless itw.interviews.last.nil?
    end
    # marketing information
    column :sign_in_count
    column :provider
    # interview status
    column "Interview Completed" do |itw|
      "#{itw.interviews.last.interview_completed}" unless itw.interviews.last.nil?
    end
    column "Document Submitted" do |itw|
      "#{itw.interviews.last.documents_submitted}" unless itw.interviews.last.nil?
    end
    column "Document Validated" do |itw|
      "#{itw.interviews.last.documents_validated}" unless itw.interviews.last.nil?
    end
    column "Agreement Signed" do |itw|
      "#{itw.interviews.last.agreement_signed}" unless itw.interviews.last.nil?
    end
    column "Lease Provided" do |itw|
      "#{itw.interviews.last.lease_provided}" unless itw.interviews.last.nil?
    end
    column "Lease Signed" do |itw|
      "#{itw.interviews.last.lease_signed}" unless itw.interviews.last.nil?
    end
    # cosigner information
    column "Has a RP" do |itw|
      "#{itw.interviews.last.has_a_cosigner}" unless itw.interviews.last.nil?
    end
    column "RP First Name" do |itw|
      "#{itw.interviews.last.cosigner_first_name}" unless itw.interviews.last.nil?
    end
    column "RP Last Name" do |itw|
      "#{itw.interviews.last.cosigner_last_name}" unless itw.interviews.last.nil?
    end
    column "RP Monthly Income" do |itw|
      "#{itw.interviews.last.cosigner_monthly_income}" unless itw.interviews.last.nil?
    end
    column "RP Address" do |itw|
      "#{itw.interviews.last.cosigner_address}" unless itw.interviews.last.nil?
    end
    column "RP Phone" do |itw|
      "#{itw.interviews.last.cosigner_phone}" unless itw.interviews.last.nil?
    end
    column "RP Email" do |itw|
      "#{itw.interviews.last.cosigner_email}" unless itw.interviews.last.nil?
    end
    #access information
    column :is_manager
    column :admin
    actions
  end

  form do |f|
    f.inputs "About" do
      f.input :first_name
      f.input :linkedin_first_name
      f.input :last_name
      f.input :linkedin_last_name
      f.input :date_of_birth, :start_year => 1950
      f.input :linkedin_picture_url
      f.input :current_status
      f.input :organisation_id
    end
    f.inputs "Contact information" do
      f.input :email
      f.input :phone_number
      f.input :home_address
    end
    f.inputs "Confidentiality" do
      f.input :is_manager
      f.input :admin
    end
    f.actions
  end
end




