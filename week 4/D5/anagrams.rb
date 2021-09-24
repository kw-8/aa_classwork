def first_anagram?(first, second)
  permutations(first).map {|perm| perm.join("")}.include?(second) 
end

def permutations(arr)
  return [arr] if arr.length <= 1

  first = arr.shift 
  total = []
  # print arr
  perms = permutations(arr)

  perms.each do |perm|
    # print perm
    (0..perm.length).each do |i|
      total << perm[0...i] + [first] + perm[i..-1]
    end 
  end

  total#.map {|perm| perm.join("")}
end

p first_anagram?("cat".split(""), "eat")
p first_anagram?("cat".split(""), "act")

# def permutations(array)
#   return [array] if array.length <= 1

#   first = array.shift

#   perms = permutations(array)
#   total = []

#   perms.each do |perm|
#     (0..perm.length).each do |i|
#       total << perm[0 ... i] + [first] + perm[i .. -1]
#     end
#   end
#   total
# end

p permutations("cat".split(""))


def second_anagram?(first, second)
  clone = first.dup
  second_clone = second.split("")

  clone.each_char do |char|
    if second_clone.include?(char)
      second_clone.delete_at(second_clone.index(char))
    else false end
  end

  second_clone.join("") == ""
end

p second_anagram?("tea", "eeat")
p second_anagram?("tea", "cat")
p second_anagram?("tea", "eat")

def third_anagram?(string1, string2)
  quick_sort(string1) == quick_sort(string2)
end

def quick_sort(arr)
  return arr if arr.length <= 1 
  pivot = arr.sample 

  left = []
  middle = []
  right = []

  arr.each do |ele|
    if ele == pivot 
      middle << ele
    elsif ele < pivot
      left << ele
    else 
      right << ele
    end 

  end 

  quick_sort(left) + middle + quick_sort(right)
end 

p quick_sort([6,5,4,2,2,3,4,5,62, 9])
puts third_anagram?("apple".split(""), "ppale".split(""))

def fourth_anagram?(first, second)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  first.each_char do |char|
    hash1[char] += 1
  end
  second.each_char do |char|
    hash2[char] += 1
  end
  hash1 == hash2
end
p fourth_anagram?("tea", "eeat")
p fourth_anagram?("tea", "cat")
p fourth_anagram?("tea", "eat")


def bonus_anagram?(first, second)
  hash1 = Hash.new(0)

  first.each_char do |char|
    hash1[char] += 1
  end
  second.each_char do |char|
    hash1[char] -= 1
  end
  hash1.values.all?(0)
end
p bonus_anagram?("tea", "eeat")
p bonus_anagram?("tea", "cat")
p bonus_anagram?("tea", "eat")


# first anagram
# permutations is factorial, so first anagram which relies on it is factorial

# second anagram
# goes trhough every element in each and then goes through every element in
# second_clone, so n^2

# third anagram
# uses quicksort: best case nlogn, worst case n^2, so third is also nlogn and
# potentially n^2

# fourth anagram
# fourth and bonus are exactly the same, every case is O(n) because we go iterate
# through the array a constant number of times