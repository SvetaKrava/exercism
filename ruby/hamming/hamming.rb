# frozen_string_literal: true

# class Hamming
class Hamming
  def self.compute(str1, str2)
    count = 0
    raise ArgumentError, 'Sequences must be the same length' unless str1.size == str2.size

    (0..(str1.size - 1)).each { |i| str1[i] != str2[i] && count += 1 }
    count
  end
end
