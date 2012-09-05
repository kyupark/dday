require 'sinatra'
require 'slim'
require 'active_support/core_ext/integer/inflections'
require 'dday'

class DDayApp < Sinatra::Base

  def start
    @d = DDay.new(@year, @month, @day)
    @today = @d.set_today
    @title = @string
    slim @d.template
  end
  
  def getURL
    @string = params[:string]
    @year  = params[:year].to_i
    @month = params[:month].to_i
    @day   = params[:day].to_i
  end
  
  get '/' do
    @string = "Chrsitmas"
    params[:string] = @string
    slim :index
  end

  get '/:year/:month/:day/?:string?' do
    getURL
    start
  end
  
  get '/:year-:month-:day/?:string?' do
    getURL
    start
  end
  
end