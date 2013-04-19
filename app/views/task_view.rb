class TaskView
  def display_all(lists)
    puts lists # assuming lists are in a collection. display list number and name 
  end

  def display_list(list)
    puts list.tasks
  end

  def add_task(task, list_number)
    puts "Added #{task} to #{list_number}"
  end

  def delete_task(task)
    puts "Deleted:"
    puts "#{task}"
  end

  def complete_task(task)
    puts "Completed:"
    puts "#{task}"
  end

  def choose_list
    puts "Which list would you like to change?"
    list_number = STDIN.gets.chomp.to_i
  end


end
