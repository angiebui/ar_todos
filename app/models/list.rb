class List < ActiveRecord::Base 
  has_many :tasks, :through => :list_tasks 
  has_many :list_tasks

  def to_s
    "List ##{id} -- #{name}"
  end
  
end
