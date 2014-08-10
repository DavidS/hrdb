# A person of interest
# Can login and use the interface
class Person < ActiveRecord::Base
  authenticates_with_sorcery!

  has_and_belongs_to_many :projects

  validates :password, confirmation: true
  # password doesn't have to be entered on each update
  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true

  scoped_search on: [:first_name, :last_name]

  def full_name
    [first_name, middle_name, last_name].compact.join(' ')
  end
end
