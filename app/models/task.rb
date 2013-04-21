class Task < ActiveRecord::Base

  has_many :lists, :through => :list_tasks 
  has_many :list_tasks

  def complete!
    self.completed = true
    self.save
  end

  def completed_display
    self.completed ? "[X]" : "[ ]"
  end

  def to_s
    "#{id} #{completed_display} #{description}"
  end
  
end
