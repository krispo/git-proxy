require 'sinatra'
require 'rest-client'
require 'json'

module Git
  class Proxy < Sinatra::Base
    get '/' do
      '!!! test rest !!!'
    end
  end
end