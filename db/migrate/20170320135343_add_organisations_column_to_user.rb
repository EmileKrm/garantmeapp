class AddOrganisationsColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :organisation, :boolean
  end
end
