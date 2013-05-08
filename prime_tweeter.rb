require './primes_list'
require './calc'
require 'twitter'

class PrimeTweeter

  def post
    @twitter ||= Twitter.Client.new(
      consumer_key: ENV['TWITTER_CONSUMER_KEY'],
      consumer_secret: ENV['TWITTER_CONSUMER_SECRET'],
      oauth_token: ENV['TWITTER_OAUTH_TOKEN'],
      oauth_token_secret: ENV['TWITTER_OAUTH_TOKEN_SECRET']
    )

    @primes_list ||= PrimesList.new
    p = @primes_list.select
    q = @primes_list.select
    n = 1E+5 # :KLUGE: 20130505 tgl: 10,000 is special
    
    @calc ||= Calc.new
    bbs = @calc.rand_prime( p, q, n)

    begin
      @twitter.update(bbs)
    rescue Exception
      # do nothing
    end

  end

end
