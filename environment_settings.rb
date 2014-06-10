#!/usr/bin/env ruby
require 'json'

#
# Set environmental variables
# For production it is needed to start script manually
#
def load_env
  File.open( "./application.json", "r" ) do |f|
    config ||= JSON.load( f )
		
    if ENV['RACK_ENV'] == 'development'
      # for local development
      application_env = config["development"].to_json			
      ENV['APPLICATION_ENV'] = application_env
    else			
      # for production on heroku
      application_env = config["production"].to_json
      puts `heroku config:set APPLICATION_ENV='#{application_env}'`
    end
  end	
end

load_env

