# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

first_names = [ 'Franz', 'Fritz', 'Friedrich', 'Fabian', 'Ferdinand' ]
last_names  = [ 'Mueller', 'Meier', 'Muster', 'Moser', 'Maurer'  ]

5.times do |i|
  Person.create({
    :login => "test##{i}",
    :email => "test#{i}@example.com",
    :password => "somepw#{1}",
    :first_name => first_names[i],
    :middle_name => "#{i}",
    :last_name => last_names[i],
    :ssn => "#{i}#{i}#{i}#{i}#{i}#{i}#{i}#{i}#{i}",
    :birthdate => "197#{i}-0#{i}-0#{i}",
    :address_line_1 => "#{last_names[i]}strasse",
    :address_line_2 => "#{i}#{i}#{i}#{i} Village",
    :telephone_mobile => "+1mobile23413274#{i}",
    :telephone_office => "+1office23413274#{i}",
    :telephone_private => "+1private23413274#{i}",
    :personnel_number => "#{i}",
    :first_work_day => "200#{i}-0#{i}-0#{i}",
    :working_hours_total => "#{i+5}.5",
    :working_hours_per_day => "#{i}.5",
    :holidays => "#{i+5}",
    :holidays_left => "#{i}",
    :hours => "#{i*2}.5",
    :overtime_hours => "#{i*3}.5",
    :job_description => "Job Description ##{i}",
    :internal_notes => "Internal Notes ##{i}",
  })

  Project.create({
    :name => "Project ##{i}",
  })
end
