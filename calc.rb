require 'sinatra/base'

class Primate < Sinatra::Base

  def pow_mod(n,exp,mod)
    prod = 1
    base = n % mod
    until exp.zero?
      exp.odd? and prod = (prod * base) % mod
      exp >>= 1
      base = (base * base) % mod
    end
    
    return prod
  end
  
  def bbs(p,q,n)
    nn = p * q
    
    s = (10000 * rand()).to_i / nn

    b = ""

    (0..n-1).each do
      if s.odd?
        b = b + '1'
      else
        b = b + '0'
      end
      s = pow_mod(s, 2, nn)
    end

    bbs = 0

    (0..n-1).each do |idx|
      if b[idx] == '1'
        bbs = bbs + pow_mod(2, idx, nn)
      end
    end

    return bbs
  end

  get '/' do
    p = 43
    q = 37
    n = 100
    
    "Hello World! bbs(#{p},#{q},#{n}) -> #{bbs(p,q,n)}"
  end

end
