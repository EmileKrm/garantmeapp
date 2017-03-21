class RemoveUserDuplicateColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :linkedin_first_name, :string
    remove_column :users, :linkedin_last_name, :string
  end
end
