require 'sinatra/base'
require './calc'

class App < Sinatra::Base

  get '/' do
    @p = 13
    @q = 17
    @bbs = @p * @q

    calc = Calc.new
    @result = false # calc.blum_blum_shub(@p, @q, 10)
    haml :index
  end

end
