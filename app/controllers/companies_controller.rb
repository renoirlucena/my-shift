class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @companies = policy_scope(Request)
    if params[:query].present?
      @companies = Company.search(params[:query])
    else
      @companies = Company.all
    end
  end

  def show
    authorize @car
  end

  def new
    @company = Company.new
    authorize @car
  end

  def update
    if @company.update!(company_params)
      redirect_to @company, notice: "Your company was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path, notice: "company was successfully destroyed."
  end

  def create
    @company = Company.create(company_params)
    @company.user = current_user
    authorize @company
    # current_user
    if @company.save
      redirect_to companies_path(@company)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def set_company
    @company = Company.find(params[:id])
    authorize @company
  end

  def request_params # ATUALIZAR AS PERMISSOES
    params.require(:request).permit(:brand, :model, :year, :km, :color, :type, :price, :location, :avaiable, :description, :user_id, photos: [])
  end
end
