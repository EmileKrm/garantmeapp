class AddEmailRentColumnsToInterviews < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :landlord_email, :string
    add_column :interviews, :monthly_rent, :string
  end
end
