# frozen_string_literal: true

# class Alphametics
class Alphametics
  def self.validated_puzzle?(puzzle)
    !puzzle.scan(/\b\w/).include?('0')
  end

  def self.solve(puzzle)
    chars = puzzle.gsub(/[^A-Z]/, '').chars.uniq
    (0..9).to_a.permutation(chars.length).each do |digits|
      replaced_puzzle = puzzle.tr(chars.join, digits.join)
      next unless validated_puzzle?(replaced_puzzle)
      return chars.zip(digits).to_h if eval(replaced_puzzle)
    end
    {}
  end
end
