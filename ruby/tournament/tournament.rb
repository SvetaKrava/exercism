# frozen_string_literal: true

# class Tournament
class Tournament
  def self.tally(input)
    @input = input.strip
    @teams = {}
    process
    table
  end

  def self.line(array)
    format("%-30s | %2s | %2s | %2s | %2s | %2s\n", *array)
  end

  def self.table
    board = line(%w[Team MP W D L P])
    @teams.sort_by { |key, val| [-val[:p], key] }.each do |key, val|
      str = [key, val[:mp], val[:w], val[:d], val[:l], val[:p]]
      board << line(str)
    end
    board
  end

  def self.process
    @input.split("\n").map(&:strip).each do |line|
      home, away, outcome = line.split(';')
      @teams[home] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } if @teams[home].nil?
      @teams[away] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } if @teams[away].nil?
      @teams[home][:mp] += 1
      @teams[away][:mp] += 1
      case outcome
      when 'win'
        @teams[home][:w] += 1
        @teams[home][:p] += 3
        @teams[away][:l] += 1
      when 'loss'
        @teams[away][:w] += 1
        @teams[away][:p] += 3
        @teams[home][:l] += 1
      else
        @teams[home][:d] += 1
        @teams[home][:p] += 1
        @teams[away][:d] += 1
        @teams[away][:p] += 1
      end
    end
  end
end
