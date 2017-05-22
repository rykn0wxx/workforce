require 'test_helper'

class NewsMailerTest < ActionMailer::TestCase
  test "ondemand" do
    mail = NewsMailer.ondemand
    assert_equal "Ondemand", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
