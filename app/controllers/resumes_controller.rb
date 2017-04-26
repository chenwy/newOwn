class ResumesController < ApplicationController
  before_action :authenticate_user!

  def new
    @resume = Resume.new
    @job = Job.find(params[:job_id])
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user

    if @resume.save
      redirect_to job_path(@job) #, notice: I18n.t("updateMsg")
    else
      flash[:alert] = @resume.errors.full_messages
      render :new
    end

  end

  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
end
