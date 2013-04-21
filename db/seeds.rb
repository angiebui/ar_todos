require 'faker'

def seed_tasks(number)
  number.times do
    Task.create({:description => Faker::Lorem.sentence})
  end
end
seed_tasks(100)


def seed_lists(number)
  number.times do
    List.create({:name => Faker::Lorem.word})
  end
end
seed_lists(10)


def seed_relationships
  all_lists = List.all
  all_tasks = Task.all

  all_tasks.each do |task|
    all_lists.sample.tasks << task
  end
end
seed_relationships

