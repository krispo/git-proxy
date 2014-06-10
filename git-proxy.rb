require 'sinatra'

module Git
  class Proxy < Sinatra::Base
    get '/' do
      '!!! test !!!'
    end
  end
end