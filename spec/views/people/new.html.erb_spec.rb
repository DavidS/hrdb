require 'rails_helper'

RSpec.describe "people/new", :type => :view do
  before(:each) do
    assign(:person, Person.new(
      :login => "MyString",
      :email => "MyString",
      :crypted_password => "MyString",
      :salt => "MyString",
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :ssn => "MyString",
      :address_line_1 => "MyString",
      :address_line_2 => "MyString",
      :address_line_3 => "MyString",
      :telephone_mobile => "MyString",
      :telephone_office => "MyString",
      :telephone_private => "MyString",
      :personnel_number => "MyString",
      :working_hours_total => 1.5,
      :working_hours_per_day => 1.5,
      :holidays => 1,
      :holidays_left => 1,
      :hours => 1.5,
      :overtime_hours => 1.5,
      :job_description => "MyText",
      :internal_notes => "MyText"
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input#person_login[name=?]", "person[login]"

      assert_select "input#person_email[name=?]", "person[email]"

      assert_select "input#person_first_name[name=?]", "person[first_name]"

      assert_select "input#person_middle_name[name=?]", "person[middle_name]"

      assert_select "input#person_last_name[name=?]", "person[last_name]"

      assert_select "input#person_ssn[name=?]", "person[ssn]"

      assert_select "input#person_address_line_1[name=?]", "person[address_line_1]"

      assert_select "input#person_address_line_2[name=?]", "person[address_line_2]"

      assert_select "input#person_address_line_3[name=?]", "person[address_line_3]"

      assert_select "input#person_telephone_mobile[name=?]", "person[telephone_mobile]"

      assert_select "input#person_telephone_office[name=?]", "person[telephone_office]"

      assert_select "input#person_telephone_private[name=?]", "person[telephone_private]"

      assert_select "input#person_personnel_number[name=?]", "person[personnel_number]"

      assert_select "input#person_working_hours_total[name=?]", "person[working_hours_total]"

      assert_select "input#person_working_hours_per_day[name=?]", "person[working_hours_per_day]"

      assert_select "input#person_holidays[name=?]", "person[holidays]"

      assert_select "input#person_holidays_left[name=?]", "person[holidays_left]"

      assert_select "input#person_hours[name=?]", "person[hours]"

      assert_select "input#person_overtime_hours[name=?]", "person[overtime_hours]"

      assert_select "textarea#person_job_description[name=?]", "person[job_description]"

      assert_select "textarea#person_internal_notes[name=?]", "person[internal_notes]"
    end
  end
end
