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
    list = find_list(list_number)
    p list
    p list.task_lists
    # list.task << Task.create({:description => self.option})
    # self.view.add_task(task, list_number)
  end

  def delete_task
    list_number = self.view.choose_list
    task = find_task(self.option)
    list = find_list(list_number)
    p list.tasks
    list.tasks.delete(task)
    list.reindex!
    p list.tasks
    self.view.delete_task(task)
  end

  def complete_task
    task = find_task(self.option)
    task.complete!
    self.view.complete_task(task)
  end

end
