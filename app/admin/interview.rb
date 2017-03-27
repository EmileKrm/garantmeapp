ActiveAdmin.register Interview do
  permit_params :professional_status, :city, :move_in_date, :monthly_budget,
  :monthly_income, :unique_signator, :has_found_apartment, :arrondissement,
  :has_a_cosigner

  index do
    selectable_column
    column :id
    column :move_in_date
    column :city
    column :professional_status
    column :monthly_income
    column :monthly_budget
    column :organisation
    column "User id" do |itw|
      unless itw.user_id.nil?
        link_to "#{itw.user_id}", admin_user_path(itw.user)
      else
        "No name submitted"
      end
    end
    actions
  end

  form do |f|
    f.inputs "Logistics" do
      f.input :move_in_date
      f.input :has_found_apartment
    end
    f.inputs "Financials" do
      f.input :professional_status
      f.input :monthly_income
      f.input :monthly_budget
    end
    f.inputs "Geography" do
      f.input :city
      f.input :arrondissement
    end
    f.actions
  end
end
