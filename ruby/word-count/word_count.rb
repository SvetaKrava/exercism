# frozen_string_literal: true

# class Phrase
class Phrase
  def initialize(str)
    @phrase = str
  end

  def word_count
    count = Hash.new(0)
    @phrase.gsub!(/[^0-9a-z \']/i, ' ')
    @phrase.split(' ').each { |word| count[word.downcase.delete_prefix("'").delete_suffix("'")] += 1 }
    count
  end
end
