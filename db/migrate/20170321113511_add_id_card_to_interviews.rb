class AddIdCardToInterviews < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :id_card, :string
  end
end
