require 'rubygems'
require './primes_list'
require './calc'
require 'twitter'

namespace :jobs do
  desc 'Computes and tweets a prime number'
  task :compute do
    Twitter.configure do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.oauth_token = ENV['TWITTER_OAUTH_TOKEN']
      config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
    end

    primes_list = PrimesList.new
    p = primes_list.select
    q = primes_list.select
    n = 1E+4
    
    calc = Calc.new
    bbs = calc.rand_prime( p, q, n)

#    begin
      Twitter.update(bbs)
#    rescue Exception
      # do nothing
#    end

  end

end
