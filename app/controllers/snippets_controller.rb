class SnippetsController < ApplicationController
  before_action :set_snippet, only: [:show, :edit, :update, :destroy]
  before_action :check_current_coder, only: [:edit, :update, :destroy]

  # GET /snippets
  # GET /snippets.json
  def index
    current_coder ? @snippets = Snippet.where(coder_id: current_coder.id) :
      @snippets = Snippet.where(coder_id: 1000)
  end

  # GET /snippets/1
  # GET /snippets/1.json
  def show
    @project = @snippet.project
  end

  # GET /snippets/new
  def new
    @snippet = Snippet.new
  end

  # GET /snippets/1/edit
  def edit
  end

  # POST /snippets
  # POST /snippets.json
  def create
    @snippet = Snippet.new(snippet_params)
    @project = Project.find_by(project_name: params[:project_name])
    @snippet.project_id = @project.id
    @snippet.coder_id = current_coder.id
    respond_to do |format|
      if @snippet.save
        format.html { redirect_to @snippet, notice: 'Snippet was successfully created.' }
        format.json { render :show, status: :created, location: @snippet }
      else
        format.html { render :new }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snippets/1
  # PATCH/PUT /snippets/1.json
  def update
    respond_to do |format|
      if @snippet.update(snippet_params)
        @project = Project.find_by(project_name: params[:project_name])
        @snippet.project_id = @project.id
        @snippet.save
        format.html { redirect_to @snippet, notice: 'Snippet was successfully updated.' }
        format.json { render :show, status: :ok, location: @snippet }
      else
        format.html { render :edit }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  # DELETE /snippets/1.json
  def destroy
    @snippet.destroy
    respond_to do |format|
      format.html { redirect_to snippets_url, notice: 'Snippet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_snippet
    @snippet = Snippet.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def snippet_params
    params.require(:snippet).permit(:objective, :image_name, :github_file_link, :project_id, :coder_id)
  end

  def check_current_coder
    if current_coder.nil?
      redirect_to '/'
    elsif current_coder.id != @snippet.coder_id
      redirect_to '/'
    end
  end
end
