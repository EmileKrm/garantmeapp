ActiveAdmin.register Interview do
  permit_params :professional_status, :city, :move_in_date, :monthly_budget,
  :monthly_income, :unique_signator, :has_found_apartment, :arrondissement,
  :has_a_cosigner, :address, :status, :landlord_email, :monthly_rent, :interview_completed,
  :documents_submitted, :documents_validated, :agreement_signed, :lease_provided, :lease_signed,
  :organisation_id, :interview_id, :organisation, :move_in_date, :created_date,
  :home_address, :professional_status, :job_title, :work_place, :city, :monthly_budget,
  :monthly_income, :has_found_apartment, :arrondissement, :address, :appartment_address,
  :monthly_rent, :landlord_email, :landlord_phone, :provider, :interview_completed,
  :documents_submitted, :documents_validated, :agreement_signed, :lease_provided, :lease_signed,
  :has_a_cosigner, :cosigner_first_name, :cosigner_last_name, :cosigner_monthly_income, :cosigner_address,
  :cosigner_phone, :cosigner_email

  # Displayed columns in interview index
  index do
    selectable_column
    column :id
    column :move_in_date
    column :city
    column :professional_status
    column :monthly_income
    column :monthly_budget
    column :organisation
    # linked user email to user show
    column "User id" do |itw|
      unless itw.user_id.nil?
        link_to "#{itw.user.email}", admin_user_path(itw.user)
      else
        "No name submitted"
      end
    end
    # allows edit view and delete
    actions
  end

  # View of edit
  form do |f|
    f.inputs "Logistics" do
      f.input :move_in_date
      f.input :has_found_apartment
      f.input :landlord_email
    end
    f.inputs "Financials" do
      f.input :professional_status
      f.input :monthly_income
      f.input :monthly_budget
      f.input :monthly_rent
      f.input :has_a_cosigner
      f.input :unique_signator
    end
    f.inputs "Geography" do
      f.input :city
      f.input :arrondissement
      f.input :address
    end
    f.inputs "Application info" do
      f.input :status
      f.input :user_id
      f.input :organisation_id
      f.input :interview_completed
      f.input :documents_submitted
      f.input :documents_validated
      f.input :agreement_signed
      f.input :lease_provided
      f.input :lease_signed
    end
    f.actions
  end
end
