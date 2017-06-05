class AddResponsiblePartyToInterviews < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :cosigner_first_name, :string
    add_column :interviews, :cosigner_last_name, :string
    add_column :interviews, :cosigner_monthly_income, :integer
    add_column :interviews, :cosigner_address, :string
    add_column :interviews, :cosigner_phone, :string
    add_column :interviews, :cosigner_email, :string
  end
end
