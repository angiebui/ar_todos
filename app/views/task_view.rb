class TaskView
  def display_all(lists)
    puts lists # assuming lists are in a collection. display list number and name 
  end

  def display_list(list)
    list.tasks.each_with_index{ |t, i| puts "#{i+1} #{t}"}
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

  def get_position
    puts "Which position would you like to insert this task?"
    STDIN.gets.chomp.to_i
  end

  def get_task_in_list
    puts "Which position in this list would you like to change?"
    STDIN.gets.chomp.to_i
  end
end
