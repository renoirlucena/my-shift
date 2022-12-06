# Preview all emails at http://localhost:3000/rails/mailers/exchange_mailer
class ExchangeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/exchange_mailer/new_exchange
  def new_exchange
    # ExchangeMailer.new_exchange
    exchange = Exchange.last
    # This is how you pass value to params[:user] inside mailer definition!
    ExchangeMailer.with(exchange: exchange).new_exchange
  end

  

end
