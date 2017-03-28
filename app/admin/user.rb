ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :first_name, :last_name, :phone_number,
  :date_of_birth, :home_address, :is_manager, :admin, :organisation_id, :interview_id,
  :linkedin_picture_url, :linkedin_first_name, :linkedin_last_name,
  :admin, :current_status

  index do
    selectable_column
    column :id
    column :first_name
    column :last_name
    column :organisation
    column "Last Interview n°" do |itw|
        unless itw.interviews.last.nil?
          link_to "#{itw.interviews.last.id}", admin_interview_path(itw.interviews.last)
        else
          " - "
        end
      end
    column :date_of_birth
    column :phone_number
    column :email
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
      f.input :date_of_birth
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
