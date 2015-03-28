class CodersController < ApplicationController
  before_action :set_coder, only: [:show, :edit, :update, :destroy]
  before_action :check_current_coder, only: [:show, :edit, :update, :destroy]

  # GET /coders
  # GET /coders.json
  def index
    current_coder ? @coders = Coder.where(id: current_coder.id) : @coders = Coder.where(id: 1000)
  end

  # GET /coders/1
  # GET /coders/1.json
  def show
  end

  # GET /coders/new
  def new
    @coder = Coder.new
  end

  # GET /coders/1/edit
  def edit
  end

  # POST /coders
  # POST /coders.json
  def create
    @coder = Coder.new(coder_params)
    respond_to do |format|
      if @coder.save
        session[:coder_id] = @coder.id
        format.html { redirect_to dashboard_path(@coder.id), notice: "Thank you for signing up. You are signed in as: #{@coder.coder_name}." }
        format.json { render :show, status: :created, location: @coder }
      else
        format.html { render :new }
        format.json { render json: @coder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coders/1
  # PATCH/PUT /coders/1.json
  def update
    respond_to do |format|
      if @coder.update(coder_params)
        format.html { redirect_to @coder, notice: "#{@coder.coder_name} was successfully updated." }
        format.json { render :show, status: :ok, location: @coder }
      else
        format.html { render :edit }
        format.json { render json: @coder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coders/1
  # DELETE /coders/1.json
  def destroy
    @coder.destroy
    session[:coder_id] = nil
    session[:coders_email] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: "#{@coder.coder_name}'s account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_coder
    @coder = Coder.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def coder_params
    params.require(:coder).permit(:coder_name, :password, :password_confirmation, :email, :phone)
  end

  def check_current_coder
    if current_coder.nil?
      redirect_to '/'
    elsif current_coder.id != @coder.id
      redirect_to '/'
    end
  end
end
