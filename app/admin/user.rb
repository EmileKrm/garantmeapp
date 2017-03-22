ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :first_name, :last_name, :phone_number,
  :date_of_birth, :home_address, :is_manager, :provider, :uid, :admin, :organisation_id, :interview_id

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
end
