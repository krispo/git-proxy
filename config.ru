require 'rubygems' 
require 'bundler/setup'  

Bundler.require(:default)  

require './git-proxy.rb'

run Git::Proxy