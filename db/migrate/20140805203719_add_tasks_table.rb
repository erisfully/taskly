class AddTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.references :task_list
    end
  end
end
