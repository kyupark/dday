class DDay < Sinatra::Base
  set :port, 80
  
  get '/' do
    @title = "dday"
    haml :index
  end

  get '/:year/:mon/:day' do
  
  end
end