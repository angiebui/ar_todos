require_relative 'config/application'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

def main(command,options)
  TaskController.new(command,options)
end

if ARGV[0]
  main(ARGV[0],ARGV[1..-1])
else
  puts "You can type list to see all the tasks."
end
