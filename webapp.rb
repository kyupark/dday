require 'sinatra'
require 'slim'
require 'active_support/core_ext/integer/inflections'
require 'dday'

class DDayApp < Sinatra::Base

  def getURL
    @year  = params[:year].to_i
    @month = params[:month].to_i
    @day   = params[:day].to_i
    @string = params[:string]
  end
  
  def start
    @d = DDay.new(@year, @month, @day)
    @today = @d.set_today
    slim @d.template
  end
  
  get '/' do
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