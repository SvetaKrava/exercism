# frozen_string_literal: false

# class Crypto
class Crypto
  def initialize(phrase)
    @phrase = phrase.downcase.gsub(/[^0-9a-z]/i, '')
  end

  def ciphertext
    cols = size(@phrase.length)
    return @phrase unless @phrase.length > 1

    cryptit(cols)
  end

  private

  def size(num)
    Math.sqrt(num).ceil
  end

  def cryptit(cols)
    crypted = []
    cphrase = ''
    first = true
    (0..@phrase.length).step(cols) { |i| crypted << @phrase[i, cols].chars }
    (crypted[-1].size..cols - 1).each { |i| crypted[-1][i] = ' ' } if crypted[-1].size < cols
    rows, rem = @phrase.size.divmod(cols)
    rows = rem.zero? ? rows : rows + 1
    crypted.pop until crypted.size == rows
    crypted.transpose.each do |w|
      cphrase << ' ' unless first
      cphrase << w.join.to_s
      first = false
    end
    cphrase
  end
end
