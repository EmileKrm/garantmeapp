class ChangeHameAddressColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :hame_address, :home_address
  end
end
