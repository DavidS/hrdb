class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  private
    def person_params
      params.require(:person).permit(:login, :email, :password,
        :password_confirmation, :first_name, :middle_name, :last_name, :ssn,
        :birthdate, :address_line_1, :address_line_2, :address_line_3,
        :telephone_mobile, :telephone_office, :telephone_private,
        :personnel_number, :first_work_day, :working_hours_total,
        :working_hours_per_day, :holidays, :holidays_left, :hours,
        :overtime_hours, :public_job_description, :private_notes)
    end
end
