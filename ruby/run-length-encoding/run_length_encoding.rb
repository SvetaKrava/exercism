# frozen_string_literal: false

# class RunLengthEncoding
class RunLengthEncoding
  def self.encode(str)
    reps = 1
    answer = ''
    (1..str.length).each do |i|
      if str[i] == str[i - 1]
        reps += 1
      else
        reps = '' if reps == 1
        answer << "#{reps}#{str[i - 1]}"
        reps = 1
      end
    end
    answer
  end

  def self.decode(str)
    answer = ''
    reps = ''
    str.chars.each do |c|
      if c.number?
        reps += c
      else
        reps = 1 if reps == ''
        answer += c * reps.to_i
        reps = ''
      end
    end
    answer
  end
end

# class String
class String
  def number?
    true if Float(self)
  rescue StandardError
    false
  end
end
