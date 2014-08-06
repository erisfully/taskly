class Task < ActiveRecord::Base

  belongs_to :task_list
  validates :task, :presence => true
  validates :task_list_id, :presence => true
  validates :date, :presence => true

end