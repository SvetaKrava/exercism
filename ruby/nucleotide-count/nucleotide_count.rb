# frozen_string_literal: true

# class Nucleotide
class Nucleotide
  attr_reader :histogram

  def initialize(dna)
    @dna = dna
    @histogram = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
    process
  end

  def self.from_dna(dna)
    new(dna)
  end

  def count(nuc)
    @histogram[nuc]
  end

  private

  def nucleotide?(nuc)
    raise ArgumentError unless @histogram.key?(nuc)

    true
  end

  def process
    @dna.each_char { |nuc| @histogram[nuc] += 1 if nucleotide?(nuc) }
  end
end
