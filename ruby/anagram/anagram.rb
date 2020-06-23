# frozen_string_literal: true

# class Anagram
class Anagram
  def initialize(word)
    @word = word
  end

  def match(list)
    matches = []
    list.each do |word|
      ismatch = true
      word.downcase.each_char do |c|
        ismatch = false unless @word.downcase.count(c) == word.downcase.count(c)
      end
      ismatch = ismatch && word.size == @word.size && @word.downcase != word.downcase
      matches << word if ismatch
    end
    matches
  end
end
