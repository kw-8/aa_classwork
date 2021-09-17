def permutations(array)
  return [array, [array[1],array[0]]] if array.length == 2
  new_arr = []
  array.each do |el|
    where = array.index(el)
    next_arr = array[0...where]+array[where+1..-1]
    permutations(next_arr).each do |subperm|
      new_arr << [el] + subperm
    end
  end
  new_arr
end

# p permutations([1, 2, 3])

# subsets([]) => [[]]
# subsets([1]) => [[], [1]]
# subsets([1,2]) => [[], [1], [2], [1,2]]

def subsets(arr)
  return [[]] if arr.empty?

  earlier = subsets(arr[0...-1])
  new_arr = earlier.dup
  earlier.each{|subs| new_arr << (subs + [arr[-1]])}

  new_arr
end

p subsets([])     # => [[]]
p subsets([1])    # => [[], [1]]
p subsets([1,2])    # => [[], [1], [2], [1,2]]