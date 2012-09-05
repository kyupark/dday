require 'sinatra'
require 'slim'
require 'active_support/core_ext/integer/inflections'
require 'dday'

class DDayApp < Sinatra::Base

  def get_URL
    @year   = params[:year].to_i
    @month  = params[:month].to_i
    @day    = params[:day].to_i
    @string = params[:string]
  end
  
  def correct_date?
    if @year.to_i > 3000 && @month.to_i > 12 && @day.to_i > 31
      return false
    else
      return true
    end
  end
  
  def start
    @d = DDay.new(@year, @month, @day)
    @today = @d.set_today
    slim @d.template
  end
  
  not_found do
    redirect to('/')
  end
  
  get '/' do
    slim :index
  end

  get '/:year/:month/:day/?:string?' do
    get_URL
    if correct_date?
      start
    else
      redirect to('/')
    end
  end
  
  get '/:year-:month-:day/?:string?' do
    get_URL
    if correct_date?
      start
    else
      redirect to('/')
    end
  end
  
  get '/:year.:month.:day/?:string?' do
    get_URL
    if correct_date?
      start
    else
      redirect to('/')
    end
  end
  
end