# frozen_string_literal: true

# class Palindromes
class Palindromes
  attr_reader :largest, :smallest

  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
    @palindrome_factors = Hash.new { |hash, key| hash[key] = [] }
  end

  def generate
    all_factors
      .filter { |pair| palindrome?(pair.first * pair.last) }
      .each   { |pair| palindrome_factors[pair.first * pair.last] << pair }
    @largest  = edges(:max)
    @smallest = edges(:min)
  end

  private

  attr_reader :max_factor, :min_factor, :palindrome_factors

  Palindrome = Struct.new(:value, :factors)

  def edges(mami)
    value = palindrome_factors.keys.send(mami)
    Palindrome.new(value, palindrome_factors[value])
  end

  def all_factors
    (min_factor..max_factor).to_a.repeated_combination(2)
  end

  def palindrome?(num)
    num.to_s == num.to_s.reverse
  end
end
