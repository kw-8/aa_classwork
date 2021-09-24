def first_anagram?(first, second)
  
end


def second_anagram?(first, second)
  clone = first.dup
  second_clone = second.split("")

  clone.each_char do |char|
    second_clone.delete_at(second_clone.index(char)) if second_clone.include?(char)
  end

  second_clone.join("") == ""
end

p second_anagram?("tea", "eeat")
p second_anagram?("tea", "cat")
p second_anagram?("tea", "eat")