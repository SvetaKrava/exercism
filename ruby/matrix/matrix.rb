class Matrix
  attr_reader :rows, :columns

  def initialize(s)
      @rows = s.each_line.map { |e| e.split.map(&:to_i) }
      @columns = @rows.transpose
  end

end
