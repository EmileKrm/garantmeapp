class AddJobToInterviews < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :job_title, :string
    add_column :interviews, :work_place, :string
  end
end
