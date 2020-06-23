# frozen_string_literal: true

# class TwelveDays
class TwelveDays
  def self.song
    gifts = {
      first: 'a Partridge in a Pear Tree',
      second: 'two Turtle Doves',
      third: 'three French Hens',
      fourth: 'four Calling Birds',
      fifth: 'five Gold Rings',
      sixth: 'six Geese-a-Laying',
      seventh: 'seven Swans-a-Swimming',
      eighth: 'eight Maids-a-Milking',
      ninth: 'nine Ladies Dancing',
      tenth: 'ten Lords-a-Leaping',
      eleventh: 'eleven Pipers Piping',
      twelfth: 'twelve Drummers Drumming'
    }

    lines = ''
    line = ''
    bol = ''
    gifts.each do |day, gift|
      sep = day == :first ? ', and ' : ', '
      lines = "#{lines}#{bol}On the #{day} day of Christmas my true love gave to me: #{gift}#{line}."
      line = "#{sep}#{gift}#{line}"
      bol = "\n\n"
    end
    "#{lines}\n"
  end
end
