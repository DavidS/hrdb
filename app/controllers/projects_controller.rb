class ProjectsController < ApplicationController
  include DefaultResponses

  before_action :set_project, only: [:show, :add_person, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.search_for(params[:search], :order => params[:order])
  rescue => e
    flash[:error] = e.to_s
    @projects = Project.search_for ''
  end

  def auto_complete_search
    begin
      @items = Project.complete_for(params[:search])
    rescue ScopedSearch::QueryNotSupported => e
      @items = [{:error =>e.to_s}]
    end
    render :json => @items
  end

  def auto_complete_people_search
    begin
      @items = Person.complete_for(params[:people_search])
    rescue ScopedSearch::QueryNotSupported => e
      @items = [{:error =>e.to_s}]
    end
    render :json => @items
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @searched_people = params.has_key?(:people_search) ? Person.search_for(params[:people_search], :order => params[:people_order]) : []
  end

  def add_person
    @project.people << Person.find(params[:person_id])
    default_save_response @project
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    default_save_response @project
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    default_update_response @project, project_params
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    default_destroy_response projects_url, 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name)
    end
end
