class AddLinkedinColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :linkedin_first_name, :string
    add_column :users, :linkedin_last_name, :string
  end
end
