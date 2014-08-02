class ProjectsController < ApplicationController
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

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Person was successfully added.' }
        format.json { render :show, status: :added, location: @project }
      else
        format.html { render :show }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
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

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
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
