json.array!(@people) do |person|
  json.extract! person, :id, :login, :email, :password, :password_confirmation, :first_name, :middle_name, :last_name, :ssn, :birthdate, :address_line_1, :address_line_2, :address_line_3, :telephone_mobile, :telephone_office, :telephone_private, :personnel_number, :first_work_day, :working_hours_total, :working_hours_per_day, :holidays, :holidays_left, :hours, :overtime_hours, :job_description, :internal_notes
  json.url person_url(person, format: :json)
end
