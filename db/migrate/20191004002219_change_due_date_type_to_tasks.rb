class ChangeDueDateTypeToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :due_date, :date
  end
end
