# frozen_string_literal: true

# class Game
class Game
  attr_reader :scorecard

  def initialize
    @frame = 0
    @frametotal = 0
    @ball = 0
    @eframes = 0
    @scorecard = Array.new(11) { Array.new(4, nil) }
    @ineframe = false
  end

  def roll(pins)
    @frametotal += pins
    validate?(pins) unless @frame == 10
    @scorecard[@frame][@ball] = pins
    do_bonuses(pins)
    @scorecard[@frame][3] = '/' if spare?(pins)
    @scorecard[@frame][3] = 'X' if strike?(pins)
    if @frame == 10
      @ineframe = true
      do_eframes(pins)
      close_game if @eframes.zero?
    else
      do_work(pins)
    end
    @eframes = check_eframes if @frame == 10 && !@ineframe
    rescore
  end

  def score
    raise BowlingError unless closed?

    @scorecard[10][2]
  end

  class BowlingError < StandardError; end

  private

  def rescore
    @scorecard[10][2] = 0
    @scorecard[0..9].each { |frame| @scorecard[10][2] += frame[2] if frame[2].is_a?(Integer) }
  end

  def check_eframes
    efs = 0
    case @scorecard[9][3]
    when '/'
      efs = 1
    when 'X'
      efs = 2
    else
      close_game
    end
    efs
  end

  def close_game
    @scorecard[10][3] = 'closed'
  end

  def closed?
    @scorecard[10][3] == 'closed'
  end

  def do_eframes(pins)
    lim = 10
    if @ball == 1
      lim = @scorecard[10][0].is_a?(Integer) ? 10 - @scorecard[10][0] : 10
    end
    lim = 10 if lim.zero?
    raise BowlingError unless (0..lim).include?(pins)
    raise BowlingError unless @eframes.positive?

    @eframes -= 1
    @ball += 1
  end

  def do_work(pins)
    if strike?(pins) || @ball == 1
      sum = 0
      @scorecard[@frame].each { |x| sum += x if x.is_a?(Integer) }
      @scorecard[@frame][2] = sum
      @frame += 1
      @frametotal = 0
      @ball = 0
    else
      @ball += 1
    end
  end

  def validate?(pins)
    raise BowlingError if closed?
    raise BowlingError unless (0..10).include?(pins) && @frametotal <= 10
    raise BowlingError if @frame == 10 && @ball == 1 && @frametotal > 10 && @scorecard[@frame][0] != 10
  end

  def strike?(pins)
    @ball.zero? && pins == 10 && @frame != 10
  end

  def spare?(pins)
    @ball == 1 && pins + @scorecard[@frame][0] == 10 && @frame != 10
  end

  def do_bonuses(pins)
    @scorecard[@frame - 1][2] += pins if @scorecard[@frame - 1][3] == '/' && @ball.zero?
    @scorecard[@frame - 1][2] += pins if @scorecard[@frame - 1][3] == 'X'
    return unless @scorecard[@frame - 1][3] == 'X' && @ball.zero? && @scorecard[@frame - 2][3] == 'X'

    @scorecard[@frame - 2][2] += pins
  end
end
