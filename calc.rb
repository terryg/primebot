class Calc

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
  
  def miller_rabin_pass(n, k)
    d = n - 1
    s = 0
    while d % 2 == 0 do
      d /= 2
      s += 1
    end

    k.times do
      a = 2 + rand(n-4)
      x = pow_mod(a, d, n)
      next if x == 1 or x == n-1
      for r in (1 .. s-1)
        x = pow_mod(x,2,n)
        return false if x == 1
        break if x == n-1
      end
      return false if x != n-1
    end
    true # probably
  end

  def miller_rabin(n)
    for i in 0...10 do
      a = 0
      while a == 0
        a = rand(n)
      end
      if (!miller_rabin_pass(a, n))
        return false
      end
    end
    return true
  end

  def blum_blum_shub(p,q,n)
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

  def rand_prime(p, q, n)
    bbs = blum_blum_shub(p, q, n)
    
    until miller_rabin_pass(bbs, 10)
      bbs = blum_blum_shub(p, q, n)
    end

    return bbs
  end


end
