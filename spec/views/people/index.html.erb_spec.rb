require 'rails_helper'

RSpec.describe "people/index", :type => :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        :login => "Login",
        :email => "Email",
        :password => "foo",
        :password_confirmation => "foo",
        :salt => "Salt",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :ssn => "Ssn",
        :address_line_1 => "Address Line 1",
        :address_line_2 => "Address Line 2",
        :address_line_3 => "Address Line 3",
        :telephone_mobile => "Telephone Mobile",
        :telephone_office => "Telephone Office",
        :telephone_private => "Telephone Private",
        :personnel_number => "Personnel Number",
        :working_hours_total => 1.5,
        :working_hours_per_day => 2.5,
        :holidays => 1,
        :holidays_left => 2,
        :hours => 3.5,
        :overtime_hours => 4.5,
        :job_description => "MyText",
        :internal_notes => "MyText2"
      ),
      Person.create!(
        :login => "Login2",
        :email => "Email2",
        :password => "foo",
        :password_confirmation => "foo",
        :salt => "Salt",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :ssn => "Ssn",
        :address_line_1 => "Address Line 1",
        :address_line_2 => "Address Line 2",
        :address_line_3 => "Address Line 3",
        :telephone_mobile => "Telephone Mobile",
        :telephone_office => "Telephone Office",
        :telephone_private => "Telephone Private",
        :personnel_number => "Personnel Number",
        :working_hours_total => 1.5,
        :working_hours_per_day => 2.5,
        :holidays => 1,
        :holidays_left => 2,
        :hours => 3.5,
        :overtime_hours => 4.5,
        :job_description => "MyText",
        :internal_notes => "MyText2"
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => "Login".to_s, :count => 1
    assert_select "tr>td", :text => "Login2".to_s, :count => 1
    assert_select "tr>td", :text => "Email".to_s, :count => 1
    assert_select "tr>td", :text => "Email2".to_s, :count => 1
    assert_select "tr>td", :text => "Crypted Password".to_s, :count => 0
    assert_select "tr>td", :text => "Salt".to_s, :count => 0
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ssn".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line 1".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line 2".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line 3".to_s, :count => 2
    assert_select "tr>td", :text => "Telephone Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Telephone Office".to_s, :count => 2
    assert_select "tr>td", :text => "Telephone Private".to_s, :count => 2
    assert_select "tr>td", :text => "Personnel Number".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText2".to_s, :count => 2
  end
end
