class PigLatinizer
  
  attr_reader :words
  
  def initialize(words=nil)
    @words = words.downcase unless words.nil?
  end
  
  def piglatinize(words)
    parsed_phrase = words.split(" ")
    parsed_phrase.map do |word|
      analyzed_word = WordAnalyzer.new(word)
      if analyzed_word.starts_with_vowel_sounds?
        word += 'way'
      elsif analyzed_word.starts_with_consonant_clusters?
        self.class.move_consonants_to_end(word)
      elsif analyzed_word.starts_with_consonant_sounds?
        self.class.move_consonants_to_end(word) 
      end
    end.join(" ")
  end
  
  def self.move_consonants_to_end(word)
    
    word_chars = word.split("")
    vowel_found = false
    indexes_to_remove = 0;
    punctuation = word_chars.pop if word_chars.last.match?(/[,.!?]/)
    
    word_chars.each_with_index do |char|
      if WordAnalyzer.is_consonant?(char) && vowel_found == false
        word_chars.push(char)
        indexes_to_remove += 1
      elsif WordAnalyzer.is_vowel?(char)
        vowel_found = true
      end
    end
    
    indexes_to_remove.times{ word_chars.shift }
    word_chars << 'ay' 
    word_chars << punctuation unless punctuation.nil?
    word_chars.join("")
  end
  
  
  
  
  
end