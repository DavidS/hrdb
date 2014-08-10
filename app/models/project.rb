# A project is the basic unit where time can be spent
class Project < ActiveRecord::Base
  has_and_belongs_to_many :people

  validates :name, presence: true

  scoped_search on: :name
end
