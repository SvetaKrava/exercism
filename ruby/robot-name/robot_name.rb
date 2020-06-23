# frozen_string_literal: true

# class Robot
class Robot
  attr_reader :name

  @@robots = 0
  @@namepool = []

  def initialize
    gen_names unless @@robots > 0
    new_name
    @@robots += 1
  end

  def self.forget
    @@robots = 0
  end

  def reset
    @@namepool.unshift(@name)
    new_name
  end

  private

  def new_name
    @name = @@namepool.pop
  end

  def gen_names
    @@namepool = ('AA000'..'ZZ999').to_a.shuffle
  end
end
