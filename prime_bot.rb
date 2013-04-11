require 'sinatra/base'
require './primes_list'
require './calc'

class PrimeBot < Sinatra::Base

  get '/' do
    primes_list = PrimesList.new
    @p = primes_list.select
    @q = primes_list.select
    n = 100
    
    calc = Calc.new
    @bbs = calc.rand_prime(@p.to_i,@q.to_i,n)

    begin
      Twitter.update(@bbs)
    rescue Exception
      # do nothing
    end

    haml :index
  end

end
