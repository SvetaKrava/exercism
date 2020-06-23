# frozen_string_literal: false

# class Integer
class Integer
  CONVERT = {
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1
  }.freeze

  def to_roman
    n = self
    result = ''
    return "No 0's for the Romans" if n.zero?

    CONVERT.each do |roman, arabic|
      x, n = n.divmod(arabic)
      result << roman * x
    end
    result
  end
end
