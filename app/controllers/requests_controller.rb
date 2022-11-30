class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]

  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @requests = policy_scope(Request)
    if params[:query].present?
      @requests = Request.where(
        start_time: params[:query][:start_time]..params[:query][:end_time],
        end_time: params[:query][:start_time]..params[:query][:end_time]
      )
    else
      @requests = Request.all
      @requests = @requests.where(start_time: start_date.beginning_of_week..start_date.end_of_week)
    end
  end

  def search
    start_time = params[:start_time] || DateTime.now
    end_time = params[:end_time] || DateTime.now
    @requests = Request.search(start_time, end_time)
  end

  def show
  end

  def new
    @request = Request.new
    authorize @request
  end

  def update
    if @request.update!(request_params)
      redirect_to @request, notice: "Sua solicitação foi alterada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_path, notice: "Sua solicitação foi excluída."
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
