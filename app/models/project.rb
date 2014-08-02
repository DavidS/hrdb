class Project < ActiveRecord::Base
  has_and_belongs_to_many :people

  validates_presence_of :name

  scoped_search :on => :name
end
