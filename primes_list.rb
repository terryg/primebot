class PrimesList

  PRIMES = []

  def initialize
    file = File.new("10000.txt", "r")
    while (line = file.gets)
      line.split(" ").each do |n|
        PRIMES << n
      end
    end
    file.close
    return self
  end

  def select
    idx = rand(10000)
    return PRIMES[idx].to_i
  end

  protected
  private

end
