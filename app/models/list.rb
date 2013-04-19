class List < ActiveRecord::Base
  has_many :tasks, :through => :task_lists
  has_many :task_lists
end
