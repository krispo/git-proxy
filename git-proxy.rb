require 'sinatra'
require 'rest-client'
require 'json'

module Git
  class Proxy < Sinatra::Base
    
    # test base url
    get '/' do
      '!!! test rest !!!'
    end

    #
    # Get access token for Github OAuth
    # With this access token, you’ll be able to make authenticated requests as the logged in user
    #
    # Method: GET
    # URI: {host}/github_access_token/?client_id={client_id}&code={code}
    #
    # params:
    #   client_id - unique ID of Github application
    #   code - temporary Github session code
    #
    # return: json
    #   +: {"access_token": ..., "token_type": ..., "scope": ...}
    #   -: {"error": ..., ...}
    #
    get '/github_access_token' do  
      
      # get environmental variable with sensitive data
      application_env = JSON.parse ENV['APPLICATION_ENV']

      # get temporary GitHub code
      session_code = request[:code]
      client_id = request[:client_id]
      client_secret = nil
      client_name = nil

      # get client_secret
      application_env.each do |key, value|
        if value["client_id"] == client_id then
          client_secret = value["client_secret"]
          client_name = key
          break
        end
      end

      puts "Fetching authentication request from client_name: #{client_name}, client_id: #{client_id} ..."      
      
      # POST the code back to GitHub to get token
      result = RestClient.post('https://github.com/login/oauth/access_token',
                              {:client_id => client_id,
                               :client_secret => client_secret,
                               :code => session_code},
                               :accept => :json)
      
      # for Cross-Origin Resource Sharing
      headers "Access-Control-Allow-Origin" => "*"

      # return result with access_token, scope and token_type
      result      
    end
  end
end