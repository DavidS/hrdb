class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to people_path
    else
      render :new
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    @person.update(person_params)

    if @person.save
      redirect_to people_path
    else
      render :edit
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to person_path
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
