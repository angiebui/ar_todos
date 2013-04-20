command, option = ARGV[0], ARGV[1..-1]

class TaskController
  attr_reader :command, :option, :view
  def initialize(command, option=nil)
    @command = command.downcase
    @option = option
    @view = TaskView.new
    parse!
  end

  def parse!
    case self.command
    when "all"
      display_all_lists
    when "display"
      display_list
    when "add"
      add_task
    when "delete"
      delete_task
    when "complete"
      complete_task
    end
  end

  def find_task(id)
    Task.where('id = ?', id).first
  end

  def find_list(id)
    List.where('id = ?', id).first
  end

  def display_all_lists
    self.view.display_all(List.all)
  end

  def display_list
    list = find_list(self.option)
    self.view.display_list(list)
  end

  def add_task
    list_number = self.view.choose_list
    position = self.view.get_position
    list = find_list(list_number)
    task = Task.create(:description => self.option.join(' '))
    position == -1 ? (position = list.task_lists.length) : (position = position)
    list.task_lists.insert(position, TaskList.create(:task_id => task.id, :list_id => list.id))
    list.task_lists.reload.reindex!
    self.view.display_list(list)
  end

  def delete_task
    list_number = self.view.choose_list
    list = find_list(list_number)
    self.view.display_list(list)
    task_position_number = self.view.get_task_in_list
    list.task_lists.each { |entry| entry.destroy if entry.position == task_position_number}
    list.reload.task_lists.reindex!
    self.view.display_list(list)
  end

  def complete_task
    list_number = self.view.choose_list
    list = find_list(list_number)
    position = self.view.get_position
    p list.task_lists
    task = find_task(list.task_lists.find{|entry| entry.position == position}.task_id)
    task.complete!
    self.view.display_list(list)
  end

end
