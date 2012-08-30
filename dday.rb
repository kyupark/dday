require 'rubygems'
require 'sinatra'

class DDay < Sinatra::Base
  get '/' do
    @title = "dday"
    haml :index
  end

  get '/:year/:mon/:day' do
  
  end
end