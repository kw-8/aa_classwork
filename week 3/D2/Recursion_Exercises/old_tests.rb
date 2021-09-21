# * Range
# p range(1,5)

# * Exponent
# p exp(2,2)
# p exp(2,6)

# * Exponent 2
# p exp2(2,2)
# p exp2(2,6)

# * Deep Dupe
# test_arr = [1, [2], [3, [4]]]

# test_arr_copy = test_arr.deep_dup

# test_arr[1] << 5

# p test_arr_copy
# p test_arr

# fib
# p fib(2)
# p fib(4)
# p fib(5)
# p fib(6)

# target = 1
# [3]
#  * B_Search
# p b_search([1, 2, 3], 1) # => 0
# p b_search([2, 3, 4, 5], 3) # => 1
# p b_search([2, 4, 6, 8, 10], 6) # => 2
# p b_search([1, 3, 4, 5, 9], 5) # => 3
# p b_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p b_search([1, 2, 3, 4, 5, 6], 0) # => nil
# p b_search([1, 2, 3, 4, 5, 7], 6) # => nil

# * Merge_sort
# p merge_sort([1, 2, 3].shuffle) # => 0
# p merge_sort([2, 3, 4, 5].shuffle) # => 1
# p merge_sort([2, 4, 6, 8, 10].shuffle) # => 2
# p merge_sort([1, 3, 4, 5, 9].shuffle) # => 3
# p merge_sort([1, 2, 3, 4, 5, 6].shuffle) # => 5
# p merge_sort([1, 2, 3, 4, 5, 6].shuffle) #=> nil
# p merge_sort([1, 2, 3, 4, 5, 7].shuffle) #=> nil