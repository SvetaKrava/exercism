class ResistorColorDuo
  @colors = {
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
  }

  def self.value(bands)
    str = ""
    bands.each { |value|
      str << @colors[value].to_s
    }
    str.to_i
  end
end
