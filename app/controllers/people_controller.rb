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
      params.require(:person).permit(:name, :email, :password, :password_confirmation)
    end
end
