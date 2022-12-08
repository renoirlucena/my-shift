class OrdersController < ApplicationController
  before_action :skip_authorization

  def create
    @membership = Membership.find(params[:membership_id])
    @order = Order.create!(membership: @membership, membership_sku: @membership.category,
              amount_cents: @membership.price_cents,
              state: 'pending', user: current_user)
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'brl',
          unit_amount: @membership.price_cents,
          recurring: { interval: 'month' },
          product_data: {
            name: @membership.category,
            description: 'Assinatura'
          }
        },
        quantity: 1
      }],
      subscription_data: {trial_period_days: 30},
      mode: 'subscription',
      success_url: "http://localhost:3000/orders/#{@order.id}?payment=ok",
      cancel_url: "http://localhost:3000/memberships/#{@membership.id}"
    )
    redirect_to @session.url, status: 303, allow_other_host: true
  end

  def show
    @order = Order.find(params[:id])
    if params[:payment].present?
      @order.update(state: 'paid')
      redirect_to edit_user_registration_path
    end
  end
end

  #   session = Stripe::Checkout::Session.create(
  #     payment_method_types: ['card'],
  #     line_items: [{
  #       # name: membership.category,
  #       price: membership.price_cents,
  #       # currency: 'brl',
  #       quantity: 1
  #     }],
  #     success_url: order_url(order),
  #     cancel_url: order_url(order)
  #   )

  #   order.update(checkout_session_id: session.id)
  #   redirect_to new_order_payment_path(order)
