class AvailibilitiesController < ApplicationController
  before_action :set_availibility, only: [:show, :edit, :update, :destroy]

  # GET /availibilities
  # GET /availibilities.json
  def index
    @availibilities = Availibility.all
  end

  # GET /availibilities/1
  # GET /availibilities/1.json
  def show
  end

  # GET /availibilities/new
  def new
    @availibility = Availibility.new
  end

  # GET /availibilities/1/edit
  def edit
  end

  # POST /availibilities
  # POST /availibilities.json
  def create
    @availibility = Availibility.new(availibility_params)

    respond_to do |format|
      if @availibility.save
        format.html { redirect_to @availibility, notice: 'Availibility was successfully created.' }
        format.json { render :show, status: :created, location: @availibility }
      else
        format.html { render :new }
        format.json { render json: @availibility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /availibilities/1
  # PATCH/PUT /availibilities/1.json
  def update
    respond_to do |format|
      if @availibility.update(availibility_params)
        format.html { redirect_to @availibility, notice: 'Availibility was successfully updated.' }
        format.json { render :show, status: :ok, location: @availibility }
      else
        format.html { render :edit }
        format.json { render json: @availibility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availibilities/1
  # DELETE /availibilities/1.json
  def destroy
    @availibility.destroy
    respond_to do |format|
      format.html { redirect_to availibilities_url, notice: 'Availibility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_availibility
      @availibility = Availibility.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def availibility_params
      params.require(:availibility).permit(:contractor_id, :day, :start_time, :end_time)
    end
end
