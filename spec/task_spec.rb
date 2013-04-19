require 'spec_helper'

describe Task do
  it "should have a description" do
    t = Task.create({:description => 'Dig a hole' })
    t.description.should == "Dig a hole"
  end
end
