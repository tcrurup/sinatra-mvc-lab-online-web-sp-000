class WordAnalyzer
  
  attr_reader :word
  
  def initialize(word)
    @word = word
  end
  
  def first_two_letters
    split_word = self.word.split("")
    letters = []
    split_word.each do |char|
      break if letters.length >= 2
      if(self.class.is_vowel?(char) || self.class.is_consonant?(char)) 
        letters << char 
      end
    end 
    letters
  end

  def starts_with_vowel_sounds?
    self.class.is_vowel?(word.split("").first)
  end
  
  def starts_with_consonant_clusters?
    letters = self.first_two_letters
    self.class.is_consonant?(letters[0]) && self.class.is_consonant?(letters[1])
  end
  
  def starts_with_consonant_sounds?
    letters = self.first_two_letters
    self.class.is_consonant?(letters[0]) && self.class.is_vowel?(letters[1])
  end
    
  def self.is_vowel?(char)
    char.match?(/[aeiouy]/i)
  end
  
  def self.is_consonant?(char)
    char.match?(/[bcdfghjklmnpqrstvwxz]/i)
  end
  
  def self.is_punctuation?(char)
    !self.class.is_constant?(char) && !self.class.is_vowel?(char)
  end
  
end