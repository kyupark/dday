require 'sinatra'
require 'slim'
require 'active_support/core_ext/integer/inflections'
require 'date'
require 'dday'


class DDayApp < Sinatra::Base

  def start(year, month, day, string)
    @d = DDay.new(year, month, day)
    @today = @d.set_today
    @title = string
    slim @d.template
  end
  
  get '/' do
    @string = "Chrsitmas"
    params[:string] = @string
    start(2012, 12, 25, @string)
  end

  get '/:year/:month/:day/?:string?' do
    @string = params[:string]
    year  = params[:year].to_i
    month = params[:month].to_i
    day   = params[:day].to_i
   
    start(year, month, day, @string)
  end
  
end