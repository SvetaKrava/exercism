# frozen_string_literal: true

# class series
class Series
  def initialize(ser)
    @series = ser
  end

  def slices(len)
    ans = []
    @series.length >= len ? (num = @series.length - len) : (raise ArgumentError)
    (0..num).each { |i| ans << @series[i, len] }
    ans.length.zero? && (raise 'You got nothin')
    ans
  end
end
