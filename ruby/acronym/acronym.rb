class Acronym
  def self.abbreviate(longname)
    @shortname = ""
    @longname = longname
    @longname.gsub!("-", " ")
    @longname.split(" ").each { |word|
      @shortname += word[0].upcase
    }
    return @shortname
  end
end
