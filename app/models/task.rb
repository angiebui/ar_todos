class Task < ActiveRecord::Base
  has_many :lists, :through => :task_lists
  has_many :task_lists

  def complete!
    self.completed = true
    self.save
  end

  def completed_display
    return "[ ]" unless completed
    "[X]"
  end

  def to_s
    "#{completed_display} #{description}"
  end
end
