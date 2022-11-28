class ExchangesController < ApplicationController
  before_action :set_exchange, only: %i[show edit update destroy]

  def index
    @exchanges = policy_scope(exchange)
    if params[:query].present?
      @exchanges = Exchange.search(params[:query])
    else
      @exchanges = Exchange.all
    end
  end

  def show
  end

  def new
    @exchange = Exchange.new
    authorize @car
  end

  def update
    if @exchange.update!(exchange_params)
      redirect_to @exchange, notice: "Your exchange was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @exchange.destroy
    redirect_to exchanges_path, notice: "exchange was successfully destroyed."
  end

  def create
    @exchange = Exchange.create(exchange_params)
    @exchange.user = current_user
    authorize @exchange
    # current_user
    if @exchange.save
      redirect_to exchanges_path(@exchange)
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
    params.require(:exchange).permit(:brand, :model, :year, :km, :color, :type, :price, :location, :avaiable, :description, :user_id, photos: [])
  end
end
