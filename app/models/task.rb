class Task < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :status, :name
end
