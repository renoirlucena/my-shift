class ExchangesController < ApplicationController
  before_action :set_exchange, only: %i[show edit update destroy]

  def index
    @exchanges = policy_scope(Exchange)
    if params[:query].present?
      @exchanges = Exchange.search(params[:query])
    else
      @exchanges = Exchange.all
    end
  end

  def show
    @exchange = Exchange.find(params[:id])
    @request = @exchange.request
    authorize @exchange
  end

  def new
    @request = Request.find(params[:request_id])
    @exchange = Exchange.new(request: @request, user: current_user)
    authorize @exchange
  end

  def update
    @exchange.status = 'Confirmado'
    @exchange.save
    redirect_to requests_path, notice: "Requisição aprovada com sucesso"
  end

  def destroy
    @exchange.destroy
    redirect_to requests_path, notice: "Requisição de #{@exchange.user.first_name} reprovada!"
  end

  def create
    @request = Request.find(params[:request_id])
    @exchange = Exchange.new(request: @request, user: current_user)
    # @exchange.request = @request
    authorize @exchange

    # current_user
    if @exchange.save
      mail = ExchangeMailer.with(exchange: @exchange).new_exchange
      mail.deliver_now
      redirect_to exchange_path(@exchange)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def set_exchange
    @exchange = Exchange.find(params[:id])
    authorize @exchange
  end

  def exchange_params
    params.require(:exchange).permit(:status, :user, :user_id, :request_id)
  end
end
