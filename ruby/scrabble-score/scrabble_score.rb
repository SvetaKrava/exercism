# frozen_string_literal: true

# class Scrabble
class Scrabble
  def initialize(word)
    @word = word.nil? ? ' ' : word.upcase
  end

  def score
    points = 0
    ones = 'AEIOULNRST'
    twos = 'DG'
    threes = 'BCMP'
    fours = 'FHVWY'
    fives = 'K'
    eights = 'JX'
    tens = 'QZ'
    tiles = @word.split('')
    tiles.each do |tile|
      if ones.include?(tile)
        points += 1
      elsif twos.include?(tile)
        points += 2
      elsif threes.include?(tile)
        points += 3
      elsif fours.include?(tile)
        points += 4
      elsif fives.include?(tile)
        points += 5
      elsif eights.include?(tile)
        points += 8
      elsif tens.include?(tile)
        points += 10
      end
    end
    points
  end

  def self.score(word)
    new(word).score
  end
end
