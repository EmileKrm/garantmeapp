class CreateInterviews < ActiveRecord::Migration[5.0]
  def change
    create_table :interviews do |t|
      t.string :professional_status
      t.string :city
      t.date :move_in_date
      t.integer :monthly_budget
      t.integer :monthly_income
      t.boolean :unique_signator
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
