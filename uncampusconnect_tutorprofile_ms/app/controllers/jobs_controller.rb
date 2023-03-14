class JobsController < ApplicationController
  def create
    @job = Job.new(job_params)
    if @job.save
      render json: @job, status: :created
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.require(:job).permit(:name)
  end
end
