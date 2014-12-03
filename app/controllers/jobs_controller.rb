class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    if params.has_key?(:contractor_id)
      logger.debug(current_contractor)
      logger.debug(current_contractor.id.class)
      logger.debug(params[:contractor_id].class)
      if params[:contractor_id] == current_contractor.id.to_s
        logger.debug("hello")
        logger.debug(Contractor.find(params[:contractor_id]))
        @jobs = Contractor.find(params[:contractor_id]).jobs
      else
        @jobs = []
      end
    else
      @jobs = Job.all
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    my_job_params = job_params
   my_job_params[:job_date] = DateTime.strptime(job_params[:job_date],
                                                   '%m/%d/%Y %l:%M %p')
    @job = Customer.find(params[:customer_id]).jobs.new(my_job_params)
    #    @post = @postable.posts.new(params[:post])


    respond_to do |format|
      if @job.save
        format.html { redirect_to '/', notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Job was successfully denied.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:jobTitle, :jobDescription, :jobType, :jobCost, :jobQuotedPrice, :jobUrgency, :job_date, :customer_id, :contractor_id)
    end
end
