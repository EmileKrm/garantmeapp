class RenameColumninUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :organisation, :is_manager
  end
end
