ActiveAdmin.register Lead do
  permit_params :lead_first_name, :lead_email

  index do
      selectable_column
      column :id
      column :lead_first_name
      column :lead_email
      column :created_at
      actions
  end

  form do |f|
    f.inputs "Information" do
      f.input :lead_first_name
      f.input :lead_email
    end
  end
end
