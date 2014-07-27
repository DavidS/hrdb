class PersonSessionsController < ApplicationController
  before_filter :require_no_person, :only => [:new, :create]
  before_filter :require_person, :only => :destroy

  def new
    @user_session = PersonSession.new
  end

  def create
    @user_session = PersonSession.new(params[:person_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end

  def destroy
    current_person_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_person_session_url
  end
end
