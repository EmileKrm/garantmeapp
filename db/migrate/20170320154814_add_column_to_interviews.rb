class AddColumnToInterviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :interviews, :organisation, foreign_key: true, index: true
  end
end
