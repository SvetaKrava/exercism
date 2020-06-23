# frozen_string_literal: false

# class Raindrops
class Raindrops
  def self.convert(num)
    rainspeak = ''
    (num % 3).zero? &&  rainspeak << 'Pling'
    (num % 5).zero? &&  rainspeak << 'Plang'
    (num % 7).zero? &&  rainspeak << 'Plong'
    rainspeak.empty? && rainspeak = num.to_s
    rainspeak
  end
end
