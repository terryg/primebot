require 'sinatra/base'

class PrimeBot < Sinatra::Base

  get '/' do
    haml :index
  end

end
