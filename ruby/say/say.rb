# frozen_string_literal: true

# class Say
class Say
  @@smalls = %w[zero one two three four five six seven eight nine ten eleven
    twelve
    thirteen fourteen fifteen sixteen seventeen eighteen nineteen].freeze

  @@tens = ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'].freeze

  @@scales = ['', 'thousand', 'million', 'billion'].freeze

  def initialize(num)
    raise ArgumentError unless num.between?(0, 999_999_999_999)

    @n = num
  end

  def in_english
    digit_groups = []
    group_text = []

    case @n
    when 0..19
      return @@smalls[@n]
    else
      (0..3).each do |i|
        digit_groups[i] = @n % 1000
        @n /= 1000
      end
      (0..3).each { |i| group_text[i] = dg2w(digit_groups[i]) }
      combined = group_text[0]
      (1..3).each do |i|
        combined = group_text[i] + ' ' + @@scales[i] + ' ' + combined if digit_groups[i] != 0
      end
    end

    combined.strip
  end

  private

  def dg2w(digits)
    group_text = ''

    hundreds = digits / 100
    tens_units = digits % 100
    group_text = @@smalls[hundreds] + ' hundred ' if hundreds != 0

    tens = tens_units / 10
    units = tens_units % 10
    if tens >= 2
      group_text += @@tens[tens]
      group_text += '-' + @@smalls[units] if units != 0
    elsif tens_units != 0
      group_text += @@smalls[tens_units]
    end

    group_text
  end
end
