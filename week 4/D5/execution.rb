def my_min(arr)
  arr.each do |element|
    return element if arr.all? { |ele| element <= ele}
  end 
end

# puts my_min(list)  # =>  -5

#best case: n  worst case: n^2

def my_min(arr)

  min = arr.shift
  arr.each do |ele|
    min = ele if ele < min 
  end 
  return min 

end

# n 

def largest_contiguous_subsum(list) 
  sums = []
  (0...list.length).each do |i|
    (i...list.length).each do |j|
      sums << list[i..j]

    end 
  end 
  sums.map(&:sum).max 
end

# n sq 

def largest_contiguous_subsum(list)
  
  current_sum = list.first
  largest_sum = list.first

  (1...list.length).each do |i|

    current_sum += list[i]

    if current_sum < 0 # negative val 
      current_sum = 0 

    else 
      largest_sum = current_sum if current_sum > largest_sum
    end 

  end 
  largest_sum
end

demo = [2, 3, -6, 7, -6, 7]
puts largest_contiguous_subsum(demo) # => 8 (from [7, -6, 7])