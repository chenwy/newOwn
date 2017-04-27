class Company::EnterprisesController < ApplicationController
  before_action :authenticate_user!

  layout "company"

  def index
    @company = Company.find_by(user_id: current_user.id)
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find_by(user_id: current_user.id)
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user

    if @company.save
      redirect_to company_enterprises_path
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :scale, :address, :nature, :webSite, :industry)
  end
end
