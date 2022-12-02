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
    @exchange = Exchange.new
    authorize @exchange
  end

  def update
    if @exchange.update!(exchange_params)
      redirect_to @exchange, notice: "Sua exchange foi atualizada"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @exchange.destroy
    redirect_to exchanges_path, notice: "Exchange cancelada com sucesso!"
  end

  def create
    @request = Request.find(params[:request_id])
    @exchange = Exchange.new(request: @request, user: current_user)
    @exchange.request = @request
    authorize @exchange

    # current_user
    if @exchange.save
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

  def exchange_params # ATUALIZAR AS PERMISSOES
    params.require(:exchange).permit(:status, :user_id, :request_id)
  end
end
