require 'rubygems'
require 'sinatra'

get '/' do
  haml :index
end

get '/about' do
  haml :about
end

get '/contact' do
  haml :contact
end

__END__
@@layout
%html
  %body
    = yiled

@@index
%h1 Welcome

@@about
%h1 About

@@contact
%h1 Contact  
