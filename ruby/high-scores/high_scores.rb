class HighScores
  def initialize(points)
    @points = points
  end
  def scores
    @points
  end
  def latest
    @points.pop
  end
  def personal_best
    @points.max
  end
  def personal_top_three
    @points.max(3)
  end
end
