class CreateLeads < ActiveRecord::Migration[5.0]
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :email

      t.timestamps
    end
  end
end
