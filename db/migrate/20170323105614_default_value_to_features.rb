class DefaultValueToFeatures < ActiveRecord::Migration[5.0]
  def change
    change_column :interviews, :interview_completed,  :boolean, :default => false
    change_column :interviews, :documents_submitted,  :boolean, :default => false
    change_column :interviews, :documents_validated,  :boolean, :default => false
    change_column :interviews, :agreement_signed,  :boolean, :default => false
    change_column :interviews, :lease_provided,  :boolean, :default => false
    change_column :interviews, :lease_signed,  :boolean, :default => false
  end
end



