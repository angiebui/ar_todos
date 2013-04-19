command, *options = ARGV

class TaskController
  def initialize(command, options)
    @command = command.downcase
    @options = options
    # initialize view
    # initialize model
    parse!
  end

  def parse!
    case self.command
    when "list"
      display_list
    when "add"
      add_task
    when "delete"
      delete_task
    when "complete"
      complete_task 
    end
  end

  def display_list
    # stuff that lists the task
    # calls view method that prints tasks to terminal
  end

  def add_task
    # stuff that adds the task to model
    # calls view method to print added task
  end

  def delete_task
    # call model delete metho
    # call view method to delete
  end

  def complete_task
    # calls model method to complete task
    # calls view method to show completed task
  end
end