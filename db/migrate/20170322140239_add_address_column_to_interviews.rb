class AddAddressColumnToInterviews < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :address, :string
    add_column :interviews, :status, :boolean, default: false
  end
end
