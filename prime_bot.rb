require 'sinatra/base'
require './primes_list'
require './calc'

class PrimeBot < Sinatra::Base

  get '/' do
    primes_list = PrimesList.new
    @p = primes_list.select
    @q = primes_list.select
    n = 100000000
    
    @bbs = 4 #bbs(@p.to_i,@q.to_i,n)
    @result = false
    calc = Calc.new
    if calc.miller_rabin_pass(@bbs, 10)
      Twitter.update(@bbs)
    end

    haml :index
  end

end
