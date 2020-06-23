# frozen_string_literal: true

# class Year
class Year
  def self.leap?(year)
    (year % 4).zero? ? (year % 100 != 0 || (year % 400).zero?) : false
  end
end
