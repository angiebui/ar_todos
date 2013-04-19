class Task < ActiveRecord::Base
  has_many :lists, :through => :task_lists
  has_many :task_lists
end
