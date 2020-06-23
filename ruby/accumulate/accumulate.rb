# frozen_string_literal: true

# class Array
class Array
  def accumulate
    squares = []
    each { |x| squares << (block_given? ? yield(x) : x) }
    squares
  end
end
