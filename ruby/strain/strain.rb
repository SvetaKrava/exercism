# frozen_string_literal: true

# class Array
class Array
  def keep
    kept = []
    each { |x| kept << x if yield(x) }
    kept
  end

  def discard
    discarded = []
    each { |x| discarded << x unless yield(x) }
    discarded
  end
end
