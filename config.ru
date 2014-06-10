ENV['RACK_ENV'] ||= 'development'

require 'rubygems' 
require 'bundler/setup'  

Bundler.require(:default)  

require File.expand_path('../git-proxy', __FILE__)

# Set environment vars, only for development mode.
# For production mode run 'deploy.sh' script manually
if ENV["RACK_ENV"] == 'development' then
  require File.expand_path('../environment_settings', __FILE__)
end

run Git::Proxy