# frozen_string_literal: true

# class Meetup
class Meetup
  require 'date'

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(dow, freq)
    start  = Date.new(@year, @month, WEEKS[freq][0])
    finish = Date.new(@year, @month, WEEKS[freq][1])
    (start..finish).select(&:"#{dow}?").first
  end

  WEEKS = {
    first: [1, 7],
    second: [8, 14],
    third: [15, 21],
    fourth: [22, 28],
    fifth: [29, 31],
    teenth: [13, 19],
    last: [-7, -1]
  }.freeze
end
