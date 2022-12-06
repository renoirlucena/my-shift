class RequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.newRequest.subject
  #
  def newRequest
    @request = params[:request] # Instance variable => available in view
    @url = 'http://127.0.0.1:3000/requests'
    mail(to: @request.user.email, subject: 'Voce acabou de criar uma requisicao no MyShift! Aguarde ate alguem pegar a sua chave.')
  end
end
