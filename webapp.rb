require 'sinatra'
require 'slim'
require 'active_support/core_ext/integer/inflections'
require './dday'

class DDayApp < Sinatra::Base
  
  get '/' do
    @title = "dday"
    @d = DDay.new(2012,1,1)
    slim :index
  end

  get '/:year/:month/:day/?:string?' do
    @string = params[:string]
    year  = params[:year].to_i
    month = params[:month].to_i
    day   = params[:day].to_i
   
    @title = @string
    @d = DDay.new(year, month, day)
    slim @d.coming
    
  end
  
end