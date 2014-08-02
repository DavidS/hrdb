class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      # sorcery authentication data
      t.string :login, :null => false
      t.string :email, :null => false
      t.string :crypted_password, :null => false
      t.string :salt, :null => false

      # basic data
      t.string :first_name, :null => false
      t.string :middle_name
      t.string :last_name, :null => false

      t.string :ssn
      t.date :birthdate

      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :telephone_mobile
      t.string :telephone_office
      t.string :telephone_private

      # personnel data
      t.string :personnel_number # may be empty when not yet assigned
      t.date :first_work_day
      t.float :working_hours_total, :null => false
      t.float :working_hours_per_day, :null => false
      t.integer :holidays, :null => false
      t.integer :holidays_left, :null => false
      t.float :hours, :null => false, :default => 0
      t.float :overtime_hours, :null => false, :default => 0

      t.text :job_description # visible to all
      t.text :internal_notes  # only visible to HR

      t.timestamps
    end
    add_index :people, :email, unique: true
  end
end
