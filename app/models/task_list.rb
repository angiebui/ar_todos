class TaskList < ActiveRecord::Base
  belongs_to :task
  belongs_to :list
end
