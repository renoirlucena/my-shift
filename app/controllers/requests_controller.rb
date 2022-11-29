class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]

  def index
    @requests = policy_scope(Request)
    if params[:query].present?
      @requests = Request.search(params[:query])
    else
      @requests = Request.all
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
      redirect_to requests_path
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

  def request_params
    params.require(:request).permit(:request_type, :start_time, :end_time, :origin, :destination, :available, :user_id)
  end
end
