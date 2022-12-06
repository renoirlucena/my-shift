# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/request_mailer/newRequest
  def newRequest

    request = Request.last
    # This is how you pass value to params[:user] inside mailer definition!
    RequestMailer.with(request: request).newRequest
  end
end
