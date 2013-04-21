class TaskView

  def display_all(lists)
    puts lists
  end

  def choose_list
    puts "Which list number would you like to change?"
    list_number = STDIN.gets.chomp.to_i
  end

  def display_list(list)
    puts list.tasks
  end

  def add_task(task, list)
    puts "Suh-weet. You added '#{task.description}' to List ##{list.id} #{list.name}"
  end

  def delete_task(task, list)
    puts "You deleted '#{task.description}' from List ##{list.id} #{list.name}"
  end

  def complete_task(task)
    puts "You completed '#{task.description}'. Awesome!"
  end
  
end
