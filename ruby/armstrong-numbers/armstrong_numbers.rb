# frozen_string_literal: true

# class ArmstrongNumbers
class ArmstrongNumbers
  def self.include?(num)
    len = num.to_s.length
    num.to_s.each_char { |n| num -= n.to_i**len }
    num.zero?
  end
end
