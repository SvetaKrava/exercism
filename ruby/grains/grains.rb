# frozen_string_literal: true

# class Grains
class Grains
  def self.square(int)
    raise ArgumentError unless int.between?(1, 64)

    2**(int - 1)
  end

  def self.total
    sum = 0
    (1..64).each { |i| sum += square(i) }
    sum
  end
end
