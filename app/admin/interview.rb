ActiveAdmin.register Interview do
  permit_params :professional_status, :city, :move_in_date, :monthly_budget,
  :monthly_income, :unique_signator, :has_found_apartment, :arrondissement,
  :has_a_cosigner, :user_id, :organisation_id

  index do
      selectable_column
      column :id
      column :move_in_date
      column :city
      column :professional_status
      column :monthly_income
      column :monthly_budget
      column :organisation
      column :user
      actions
  end
end
