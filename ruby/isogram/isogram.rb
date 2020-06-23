# frozen_string_literal: true

# class Isogram
class Isogram
  def self.isogram?(word)
    word.downcase!
    isaig = true
    chars = Hash.new(0)
    word.scan(/\w/).each do |c|
      chars[c] += 1
      isaig = false unless chars[c] == 1
    end
    isaig
  end
end
