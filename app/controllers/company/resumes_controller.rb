class Company::ResumesController < ApplicationController
  before_action :authenticate_user!
  layout "company"

  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes.order("created_at DESC")
  end
end
