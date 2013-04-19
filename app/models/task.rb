class Task < ActiveRecord::Base
  has_many :lists, :through => :task_lists
  has_many :task_lists

  def complete!
    self.completed = true
  end

  def completed_display
    return "[ ]" unless completed
    "[X]"
  end

  def to_s
    "#{id}: #{completed_display} #{description}"
  end
end
