class RemoveIdCardColumnFromInterviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :interviews, :id_card, :string
  end
end
