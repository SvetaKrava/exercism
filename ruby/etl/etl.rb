# frozen_string_literal: true

# class ETL
class ETL
  def self.transform(old)
    new = {}
    old.each do |score, letters|
      letters.map(&:downcase).each { |c| new[c] = score }
    end
    new
  end
end
