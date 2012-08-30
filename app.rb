require 'rubygems'
require 'sinatra'

get '/' do
  @title = "dday"
  haml :index
end

get '/:year/:mon/:day' do
  
end