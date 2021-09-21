require 'byebug'

def range(min, max)
  return [min] if max == min + 1

  range(min, max-1) + [max - 1]
end

def exp(base, exponent)
  return nil if exponent < 0
  return 1 if exponent == 0
  base * exp(base, exponent-1)
end

def exp2(base, exponent)
  return 1 if exponent == 0
  return base if exponent == 1
  
  if exponent.even?
    var = exp2(base, exponent/2)
    var * var
  else
    var = exp2(base, (exponent-1)/2)
    base * var * var
  end
end

class Array
  def deep_dup
    dup = []
    self.each do |ele|
      if ele.is_a?(Array)
        dup += [ele.deep_dup]
      else
        dup += [ele]
      end
    end
    dup
  end
end

def fib(n)
  return 0 if n == 1
  return 1 if n <= 2
  fib(n-1) + fib(n-2)
end

def b_search(arr, target)
  return nil if arr.empty?
  arr.sort!
  mid = arr.length/2
  if target == arr[mid]
    mid
  elsif target < arr[mid]
    b_search(arr[0...mid], target)
  else
    var = b_search(arr[mid+1..-1], target)
    if var == nil
      return nil
    else
      mid + 1 + var
    end    
  end
end

def merge_sort(arr)
  return arr if arr.length <= 1
  first_half = arr[0...arr.length/2]
  second_half = arr[arr.length/2..-1]
  merge(merge_sort(first_half), merge_sort(second_half))
end

def merge(first_half, second_half)
  return first_half if second_half.empty?
  return second_half if first_half.empty?

  if first_half[0] < second_half[0]
    [first_half[0]] + merge(first_half[1..-1], second_half)
  else
    [second_half[0]] + merge(first_half, second_half[1..-1])
  end
end


# 9 3 2 5 0 1 8 7
def iter_merge(first_half, second_half)
  i, j = 0, 0
  new_arr = []
  # debugger
  while i < first_half.length && j < second_half.length
    
    if first_half[i] < second_half[j]
      new_arr << first_half[i]
      i += 1
    else
      new_arr << second_half[j]
      j += 1
    end
  end

  # check to see if any length has leftovers
  if i == first_half.length
    new_arr += second_half[j..-1]
  else
    new_arr += first_half[i..-1]
  end
  new_arr
end

# def subsets(arr)
#   return [[]] if arr.length == 0
#   sub = subsets(arr[1..-1])
#   new_arr = [[arr[0]]] + sub
#   sub.each do |sub_ele|
#     new_arr << sub_ele + [arr[0]]
#   end
#   new_arr
# end

# [1,2]
# x 1 2 12
# [[], [1]]

def subsets(arr)
  return [[]] if arr.length == 0
  # return [[], arr] if arr.length == 1
  
  sub = subsets(arr[0...-1]) # subs([])
  new_arr = [[arr[-1]]]      # [[1]]
  sub.each do |sub_ele|     # [[], [1]]
    new_arr << sub_ele + [arr[-1]]
  end
  new_arr
end


p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]