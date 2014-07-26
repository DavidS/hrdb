class PeopleController < ApplicationController
  def new
  end

  def create
    @person = Person.new(person_params)

    @person.save
    redirect_to @person
  end

  def show
    @person = Person.find(params[:id])
  end

  private
    def person_params
      params.require(:person).permit(:name)
    end
end
