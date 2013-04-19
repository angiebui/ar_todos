require 'spec_helper'


describe List do
  it "should have a task" do
    l = List.create({ :name => "First" })
    t = Task.create({:description => 'Dig a hole' })
    l.tasks << t
    l.tasks.should include t
  end

  it "should have many tasks" do
    l = List.create({ :name => "First" })
    one = Task.create({:description => 'Dig a hole.' })
    two = Task.create({:description => 'Go fishing.' })
    l.tasks << one
    l.tasks << two
    l.tasks.should include one
    l.tasks.should include two
  end
end
