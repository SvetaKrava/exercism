# frozen_string_literal: false

# class BeerSong
class BeerSong
  def self.recite(bottles, verses)
    bottles.downto(bottles - verses + 1).map do |n|
      verse(n, n == bottles)
    end.join
  end

  def self.verse(num, first)
    s = ''
    s << "\n" unless first
    s << "#{remnant(num, true)} of beer on the wall, #{remnant(num)} of beer.\n"
    s << if num.zero?
           "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
         else
           "Take #{num == 1 ? 'it' : 'one'} down and pass it around, #{remnant(num - 1)} of beer on the wall.\n"
         end
    s
  end

  def self.remnant(num, caps = false)
    if num.zero?
      (caps ? 'N' : 'n') + 'o more bottles'
    else
      "#{num} bottle" + (num == 1 ? '' : 's').to_s
    end
  end
end
