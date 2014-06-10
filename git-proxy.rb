require 'sinatra'

module Git
  class Proxy < Sinatra::Base
    get '/' do
      '!!! test without rest !!!'
    end
  end
end