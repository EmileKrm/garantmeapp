class CreateAppartments < ActiveRecord::Migration[5.0]
  def change
    create_table :appartments do |t|
      t.string :appartment_address
      t.integer :rent
      t.string :landlord_email
      t.string :landlord_number

      t.timestamps
    end
  end
end
