class List < ActiveRecord::Base
  has_many :tasks, :through => :task_lists
  has_many :task_lists

  validates :name, :uniqueness => true, :format => {:with => /\b\w+\b/, :message => "Must be one word."}

  def to_s
    "#{name}"
  end

  def reindex!
    self.tasks.sort_by { |task| task.task_list_id}
  end
end



