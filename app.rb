require 'rubygems'
require 'sinatra'
require 'slim'
require './dday'

class App < Sinatra::Base
  get '/' do
    @title = "dday"
    @d = DDay.new(2012,1,1)
    slim :index
  end

  get '/:year/:month/:day' do
    year = params[:year].to_i
    month = params[:month].to_i
    day = params[:day].to_i
   
    @title = "#{year}/#{month}/#{day}" 
    @d = DDay.new(year, month, day)
    slim :index
  end
end