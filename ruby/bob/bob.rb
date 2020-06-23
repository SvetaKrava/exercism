# frozen_string_literal: true

# class Bob
class Bob
  def initialize(str)
    @s = str.strip
  end

  def self.hey(str)
    new(str).response
  end

  def response
    if silent?
      'Fine. Be that way!'
    elsif question? && yelling?
      "Calm down, I know what I'm doing!"
    elsif question?
      'Sure.'
    elsif yelling?
      'Whoa, chill out!'
    else
      'Whatever.'
    end
  end

  def question?
    @s.chars[-1] == '?'
  end

  def yelling?
    @s.upcase == @s && @s.downcase.count('a-z').positive?
  end

  def silent?
    @s == ''
  end
end
