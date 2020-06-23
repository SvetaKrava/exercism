# frozen_string_literal: true

# class SumOfMultiples
class SumOfMultiples
  def initialize(*args)
    @nums = args
  end

  def to(int)
    (1..int - 1).map do |x|
      @nums.any? { |y| (x % y).zero? } ? x : 0
    end.inject(0, &:+)
  end
end
