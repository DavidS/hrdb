class PeopleController < ApplicationController
  include DefaultResponses

  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.search_for(params[:search], :order => params[:order])
  rescue => e
    flash[:error] = e.to_s
    @people = Person.search_for ''
  end

  def auto_complete_search
    begin
      @items = Person.complete_for(params[:search])
    rescue ScopedSearch::QueryNotSupported => e
      @items = [{:error =>e.to_s}]
    end
    render :json => @items
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    default_save_response @person
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    default_update_response @person, person_params
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    default_destroy_response people_url, 'Person was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:login, :email, :password, :password_confirmation, :first_name, :middle_name, :last_name, :ssn, :birthdate, :address_line_1, :address_line_2, :address_line_3, :telephone_mobile, :telephone_office, :telephone_private, :personnel_number, :first_work_day, :working_hours_total, :working_hours_per_day, :holidays, :holidays_left, :hours, :overtime_hours, :job_description, :internal_notes)
    end
end
