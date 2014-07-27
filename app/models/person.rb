class Person < ActiveRecord::Base
  acts_as_authentic do |c|
    # add config here
  end
end
