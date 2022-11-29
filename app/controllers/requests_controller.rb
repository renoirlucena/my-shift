class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]

  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @requests = policy_scope(Request)
    if params[:query].present?
      @requests = Request.search(params[:query])
    else
      @requests = Request.all
      @requests = @requests.where(start_time: start_date.beginning_of_week..start_date.end_of_week)
    end

  end

  def show
  end

  def new
    @request = Request.new
    authorize @request
  end

  def update
    if @request.update!(request_params)
      redirect_to @request, notice: "Your request was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_path, notice: "Request was successfully destroyed."
  end

  def create
    @request = Request.create(request_params)
    @request.user = current_user
    authorize @request
    # current_user
    if @request.save
      redirect_to requests_path(@request)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def set_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def request_params # ATUALIZAR AS PERMISSOES
    params.require(:request).permit(:brand, :model, :year, :km, :color, :type, :price, :location, :avaiable, :description, :user_id, photos: [])
  end
end
