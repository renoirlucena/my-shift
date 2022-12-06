class ExchangeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.exchange_mailer.new_exchange.subject
  #
  def new_exchange
    @exchange = params[:exchange] # Instance variable => available in view
    mail(to: @exchange.request.user.email, subject: 'Voce acabou de criar uma requisicao no MyShift! Aguarde ate alguem pegar a sua chave.')
  end
end
