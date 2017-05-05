class FixLeadColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :leads, :first_name, :lead_first_name
    rename_column :leads, :email, :lead_email
  end
end
