# frozen_string_literal: true

# class Pangram
class Pangram
  def self.pangram?(str)
    alphabet = Hash.new(0)
    str.strip.split('').each { |c| alphabet[c.downcase] += 1 }
    ('a'..'z').to_a.each { |c| break false if alphabet[c] < 1 } && true
  end
end
