require 'rails_helper'

RSpec.describe "people/show", :type => :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :login => "Login",
      :email => "Email",
      :password => "Password",
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Login/)
    expect(rendered).to match(/Email/)
    expect(rendered).to_not match(/Password/)
    expect(rendered).to match(/Salt/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Ssn/)
    expect(rendered).to match(/Address Line 1/)
    expect(rendered).to match(/Address Line 2/)
    expect(rendered).to match(/Address Line 3/)
    expect(rendered).to match(/Telephone Mobile/)
    expect(rendered).to match(/Telephone Office/)
    expect(rendered).to match(/Telephone Private/)
    expect(rendered).to match(/Personnel Number/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText2/)
  end
end
