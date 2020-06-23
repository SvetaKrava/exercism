# frozen_string_literal: false

# class PhoneNumber
class PhoneNumber
  VALID_PHONE_NUMBER_REGEX = /\A[2-9][0-9]{2}[2-9][0-9]{6}\Z/.freeze

  def self.clean(str)
    new(str).clean
  end

  def initialize(str)
    @number = scrub(str)
  end

  def clean
    return @number if valid?
  end

  private

  def scrub(str)
    scrubbed = ''
    str.chars { |c| scrubbed << c if c.number? }
    scrubbed.delete_prefix('1')
  end

  def valid?
    @number =~ VALID_PHONE_NUMBER_REGEX
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
