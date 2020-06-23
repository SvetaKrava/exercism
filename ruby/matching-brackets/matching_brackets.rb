# frozen_string_literal: true

# class Brackets
class Brackets
  def self.paired?(str)
    pattern = '[^(){}\[\]]*((\((\g<0>)?\)|\{(\g<0>)?\}|\[(\g<0>)?\])?[^(){}\[\]]*)*'
    str == str.match(pattern)[0]
  end
end
