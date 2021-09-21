class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i+=1
    end
    self
  end

  def my_select(&prc)
    selected = []
    self.my_each do |ele|
      if prc.call(ele)
        selected << ele
      end
    end
    selected
  end

  def my_reject(&prc)
    rejected = []
    self.my_each do |ele|
      if !prc.call(ele)
        rejected << ele
      end
    end
    rejected
  end

  def my_any?(&prc)
    self.my_each do |ele|
      if prc.call(ele)
        return true
      end
    end
    false
  end

  def my_all?(&prc)
    count1 = self.length
    count2 = 0
    self.my_each do |ele|
      if prc.call(ele)
        count2 += 1
      end
    end
    count2 == count1
  end

  # recursion and array concatenation
  # solution/results = []
  # base case when ele is not == array, return [ele]
  # self[0].myflatten + self[1..-1].my_flatten

  # def my_flatten
  #   # return self if self.length == 1 && !self[0].is_a?(Array)
  #   # self[0].my_flatten + self[1..-1].my_flatten
  # end

  def my_flatten
    results = []
    self.my_each do |ele|
      if ele.is_a?(Array)
        results += ele.my_flatten
      else
        results += [ele]
      end
    end
    return results
  end

  # splat argument = all arrays
  # iterate thru all ele in self, create 2D array with each array containing self
  # iterate thru rows in the 2D array, add ele from all arrays

  def my_zip(*arrays)
    zipped = Array.new(self.length) { [] }
    self.each.with_index do |ele, i|
      zipped[i] << ele
      arrays.each do |array|
        zipped[i] << array[i]
      end
    end
    return zipped
  end

  def my_rotate(n = 1)
    n = n % self.length
    self[n..-1] + self[0...n]
  end

  def my_join(separator = "")
    separated = ""
    self.each.with_index do |char, i|
      if i < self.length-1
        separated += (char + separator)
      else
        separated += char
      end
    end
    separated
  end

  def my_reverse
    i = self.length-1
    reverse = []
    while i >= 0
      reverse << self[i]
      i-=1
    end
    reverse
    # return [] if self.empty?
    # self[-1] + my_reverse[0...-1]
  end




end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]