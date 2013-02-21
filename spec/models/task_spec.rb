require 'spec_helper'

describe Task do
  before do
    @task = Task.new(name: "todo", status: "queue")
  end

  subject { @task }

  it { should respond_to(:name) }
  it { should respond_to(:status) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }

  it { should be_valid }


end