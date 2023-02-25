# frozen_string_literal: true

# BEGIN
def anagramm_filter(word, arr)
  arr.reduce([]) do |acc, tested|
    test_arr = tested.each_char.to_a
    word_arr = word.each_char.to_a
    if (test_arr.size == word_arr.size) && 
      (test_arr - word_arr).empty? && 
      (word_arr - test_arr).empty?
      acc << tested
    end
    acc
  end
end
# END
