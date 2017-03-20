class AddColumnsToInterviews < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :has_found_apartment, :boolean
    add_column :interviews, :arrondissement, :string
    add_column :interviews, :has_a_cosigner, :boolean
  end
end
