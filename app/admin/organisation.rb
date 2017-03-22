ActiveAdmin.register Organisation do
  permit_params :name

  index do
      selectable_column
      column :id
      column :name
      actions
  end
end
