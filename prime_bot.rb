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
    @bbs = calc.blum_blum_shub(@p.to_i,@q.to_i,n)
    @bbs = 1 if @bbs == 0
    @result = false

    until calc.miller_rabin_pass(@bbs, 10)
      @bbs = calc.blum_blum_shub(@p.to_i,@q.to_i,n)
      @bbs = 1 if @bbs == 0
    end

    @result = true
    begin
      Twitter.update(@bbs)
    rescue Exception
      # do nothing
    end

    haml :index
  end

end
