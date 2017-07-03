ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :first_name, :last_name, :phone_number,
  :date_of_birth, :home_address, :is_manager, :admin, :organisation_id, :interview_id,
  :linkedin_picture_url, :linkedin_first_name, :linkedin_last_name,
  :admin, :current_status

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
    column :professional_status
    column :job_title
    column :work_place
    # interview information
    column :city
    column :monthly_budget
    column :monthly_income
    column :has_found_apartment
    column :arrondissement
    column :address
    # appartment information
    column :appartment_address
    column :monthly_rent
    column :landlord_email
    column :landlord_phone
    # marketing information
    column :sign_in_count
    column :provider
    # interview status
    column :interview_completed
    column :documents_submitted
    column :documents_validated
    column :agreement_signed
    column :lease_provided
    column :lease_signed
    # cosigner information
    column :has_a_cosigner
    column :cosigner_first_name
    column :cosigner_last_name
    column :cosigner_monthly_income
    column :cosigner_address
    column :cosigner_phone
    column :cosigner_email
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




