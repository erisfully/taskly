class Task < ActiveRecord::Base

  belongs_to :task_list
  belongs_to :user
  validates :task, :presence => true
  validates :task_list_id, :presence => true
  validates :date, :presence => true

end