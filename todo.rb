require_relative 'config/application'

def main(command, option)
  TaskController.new(command,option)
end

if ARGV[0]
  main(ARGV[0], ARGV[1..-1])
else
  puts "Type all to see all lists"
end