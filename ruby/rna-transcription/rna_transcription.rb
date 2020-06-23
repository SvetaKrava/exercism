# frozen_string_literal: false

# class Complement
class Complement
  @rna2dna = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }

  def self.of_dna(str)
    s = ''
    str.split('').each { |c| s << @rna2dna[c] }
    s
  end
end
