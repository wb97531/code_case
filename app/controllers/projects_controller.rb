class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :check_current_coder, only: [:edit, :update, :destroy]

  def index
		current_coder ? @projects = Project.where(coder_id: current_coder.id) :
			@projects = Project.where(coder_id: 1000)
  end

  def show
    @coder = @project.coder
  end

  def new
    @project = Project.new
  end

  def edit
    @action = 'edit'
  end

  def create
    @project = Project.new(project_params)
    @project.current = true
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

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:project_name, :github_link, :browser_project_link, :deadline, :description, :priority, :coder_id, :current)
    end

    def check_current_coder
      if current_coder == nil
        redirect_to '/'
      elsif current_coder.id != @project.coder_id
        redirect_to '/'
      end
    end
end
