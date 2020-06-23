# frozen_string_literal: true

# class Gigasecond
class Gigasecond
  def self.from(start = Time.now)
    @start = start
    @start + 10**9
  end
end
