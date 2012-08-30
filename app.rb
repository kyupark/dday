require 'rubygems'
require 'sinatra'

get '/' do
  @title = "Home Page"
  haml :index
end

get '/about' do
  @title = "About Us"
  haml :about
end

get '/contact' do
  @title = "Contact Us"
  haml :contact
end

get '/reverse/:string' do
  params[:string].reverse
end

get '/upcase/:string' do
  params[:string].upcase
end