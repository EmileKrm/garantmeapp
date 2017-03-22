ActiveAdmin.register Organisation do
  permit_params :name

  index do
      selectable_column
      column :id
      column :name
      actions
  end

  form do |f|
    f.inputs "Information" do
      f.input :name
    end
  end
end
