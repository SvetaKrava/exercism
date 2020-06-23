# frozen_string_literal: true

# class Prime
class Prime
  def self.nth(int)
    raise ArgumentError unless int.positive? && int.is_a?(Integer)

    if int > 6
      n = int * Math.log(int) + int * Math.log(Math.log(int))
      table = Sieve.new(n.round)
    else
      table = Sieve.new(13)
    end
    table.primes[int - 1]
  end
end

# class Sieve
class Sieve
  def initialize(num)
    numbers = Hash.new(true)
    @prime = []
    (2..num).step do |x|
      next unless numbers[x]

      @prime << x
      (x * 2).step(num, x) { |y| numbers[y] = false }
    end
  end

  def primes
    @prime
  end

  def count
    @prime.length
  end
end
