class Person < ActiveRecord::Base
  authenticates_with_sorcery!

  has_and_belongs_to_many :projects

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def full_name
    [ first_name, middle_name, last_name ].compact.join(' ')
  end
end
