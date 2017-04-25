class JobsController < ApplicationController

  def index
    @jobs = Job.published.paginate(page: params[:page], per_page: 5)
  end

  def show
    @job = Job.find(params[:id])
  end
end
