# frozen_string_literal: true

# class Luhn
class Luhn
  def self.valid?(str)
    digits = str.gsub(/\s+/, '').split('').reverse
    return false unless digits.size > 1

    total = 0
    even = false
    digits.each do |digit|
      return false unless digit.number?

      total += even ? (2 * digit.to_i > 9 ? 2 * digit.to_i - 9 : 2 * digit.to_i) : digit.to_i
      even = !even
    end
    (total % 10).zero?
  end
end

# class String
class String
  def number?
    true if Float(self) rescue false
  end
end
