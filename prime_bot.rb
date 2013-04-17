require 'sinatra/base'
require './primes_list'
require './calc'

class PrimeBot < Sinatra::Base

  get '/' do
    haml :index
  end

end
