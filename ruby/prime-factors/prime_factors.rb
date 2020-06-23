# frozen_string_literal: true

# class PrimeFactors
class PrimeFactors
  def self.for(num)
    pf = []
    while num.even?
      pf << 2
      num /= 2
    end
    tail = Integer.sqrt(num) + 1
    (3..tail).step(2) do |i|
      while (num % i).zero?
        pf << i
        num /= i
      end
    end
    pf << num if num > 2
    pf
  end
end
