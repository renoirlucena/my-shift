require "test_helper"

class ExchangeMailerTest < ActionMailer::TestCase
  test "new_exchange" do
    mail = ExchangeMailer.new_exchange
    assert_equal "New exchange", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
