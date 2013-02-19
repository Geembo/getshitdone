require 'spec_helper'

describe Task do
  before do
    @task = Task.new(name: "todo", status: "queue")
  end

  subject { @task }

  it { should respond_to(:name) }
  it { should respond_to(:status) }

  it { should be_valid }

  describe "when name is not present" do
    before { @task.name = " " }
    it { should_not be_valid }
  end

end