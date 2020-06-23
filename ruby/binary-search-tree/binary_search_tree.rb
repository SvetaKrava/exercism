# frozen_string_literal: true

# class Bst
class Bst
  attr_reader :data, :left, :right

  def initialize(num)
    @data = num
    @left = nil
    @right = nil
  end

  def insert(num)
    if @data < num
      @right.nil? ? @right = Bst.new(num) : @right.insert(num)
    else
      @left.nil?  ? @left = Bst.new(num) : @left.insert(num)
    end
  end

  def each
    return enum_for :each unless block_given?

    @left&.each(&Proc.new)
    yield @data
    @right&.each(&Proc.new)
  end
end
