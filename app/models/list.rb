class List < ActiveRecord::Base
  has_many :tasks, :through => :task_lists, :order => "task_lists.position ASC"
  has_many :task_lists, :order => "position ASC" do
    def reindex!
      self.each_with_index do |entry, index| 
        entry.position = index+1
        entry.save
      end
    end
  end

  validates :name, :uniqueness => true, :format => {:with => /\b\w+\b/, :message => "Must be one word."}



  def to_s
    "#{name}"
  end
end



