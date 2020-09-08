require 'twilio-ruby'
require 'sinatra'

get '/sms-quickstart' do
  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    body = 'Have you voted yet?'
    body = 'Why not? Go vote!' if params["Body"] == "No"
    body = 'That is great! American democracy thanks you.' if params["Body"] == "Yes"

    r.message(body: body)
  end

  twiml.to_s
end
