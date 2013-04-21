class TaskController
  attr_reader :command, :option, :view
  
  def initialize(command, option)
    @view = TaskView.new
    @command = command
    @option = option
    parse_command!
  end

  def parse_command!
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

  def find_list(id)
    List.where('id = ?', id).first
  end

  def find_task(id)
    Task.where('id = ?', id).first
  end

  def get_users_list
    list_number = self.view.choose_list
    list = find_list(list_number)
  end

  def display_all_lists
    self.view.display_all(List.all)
  end

  def display_list
    list = find_list(self.option)
    self.view.display_list(list)
  end

  def add_task
    list = get_users_list
    task = Task.create({:description => self.option.join})

    list.tasks << task # ARGV might make it come in an array?
    self.view.add_task(task, list)
  end

  def delete_task
    task = find_task(self.option)
    list = get_users_list

    list.tasks.delete(task)
    self.view.delete_task(task, list)
  end

  def complete_task
    task = find_task(self.option)
    
    task.complete!
    self.view.complete_task(task)
  end
  
end
