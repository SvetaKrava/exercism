# frozen_string_literal: true

# class Sieve
class Sieve
  def initialize(int)
    numbers = Hash.new(true)
    @prime = []
    (2..int).step do |x|
      next unless numbers[x]

      @prime << x
      (x * 2).step(int, x) { |y| numbers[y] = false }
    end
  end

  def primes
    @prime
  end

  def count
    @prime.length
  end
end
