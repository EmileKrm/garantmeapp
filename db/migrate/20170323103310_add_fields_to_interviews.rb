class AddFieldsToInterviews < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :interview_completed, :boolean
    add_column :interviews, :documents_submitted, :boolean
    add_column :interviews, :documents_validated, :boolean
    add_column :interviews, :agreement_signed, :boolean
    add_column :interviews, :lease_provided, :boolean
    add_column :interviews, :lease_signed, :boolean
  end
end
