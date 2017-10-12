require 'sinatra'
require "sinatra/reloader" if development?

enable :sessions

get '/' do
  "welcome to my website"
end

get '/wechat/incoming' do
    signature = params['signature'] || ''
    timestamp = params['timestamp'] || ''
    nonce = params['nonce'] || ''
    echostr = params['echostr'] || ''

    # This is the token you
    # add to the setup on WeChat
    # replace the word TOKEN with whatever
    # you enter
    token = mealorderhelper;

    # Compute the signature (note that the shared token is used too)
    verification_elements = [@token, timestamp, nonce]
    verification_elements = verification_elements.sort
    verification_string = verification_elements.join('')
    verification_string = Digest::SHA1.hexdigest(verification_string)
    # If the signature is correct, output the same "echostr" provided by the WeChat server as a parameter
    if signature == verification_string
      return echostr
    end
    return ''
end
