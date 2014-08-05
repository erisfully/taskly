class Task < ActiveRecord::Base

  belongs_to :task_list
  validates :task, :presence => true

end