class Company::JobsController < ApplicationController
  before_action :authenticate_user!

  layout "company"

  def index
    @jobs = Job.all.paginate(page: params[:page], per_page: 1)
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to company_jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to company_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to company_jobs_path
  end

  #发布招聘信息
  def publish
    @job = Job.find(params[:id])
    @job.publish!
    flash[:notice] = "发布招聘信息成功"
    redirect_to company_jobs_path
  end

  #隐藏招聘信息
  def hide
    @job = Job.find(params[:id])
    @job.hide!
    flash[:notice] = "隐藏招聘信息成功"
    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :contact_email, :phone, :wage_lower_bound, :wage_upper_bound, :workplace, :require_num, :duty, :job_class, :is_hidden)
  end
end
