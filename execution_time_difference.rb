# Phase I
# First, write a function that compares each element to
# every other element of the list. Return the element if
# all other elements in the array are larger.
# What is the time complexity for this function?

# => O(n) = n^2
def my_min(array)
  array.each_with_index do |val,idx|
    smallest = true
    array.each_with_index do |val2, idx2|
      next if idx == idx2
      smallest = false if val > val2
    end
    return val if smallest == true
  end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
 my_min(list)  # =>  -5


# Phase II
# Now rewrite the function to iterate through the list just
# once while keeping track of the minimum. What is the time complexity?

# O(n) = n
def my_min_iter(array)
  smallest = array.first

  array.each do |val|
    smallest = val if smallest > val
  end
  smallest
end

 my_min_iter(list)  # =>  -5


# Phase I
# Write a function that iterates through the array and finds all
# sub-arrays using nested loops. First make an array to hold all
# sub-arrays. Then find the sums of each sub-array and return the max.

# => O(n) = n^2
def largest_contiguous_subsum(array)
  subs_array = []
  array.each_with_index do |val, idx|
    idx2 = idx + 1
    while idx2 < array.length
      subs_array << array[idx..idx2]
      idx2 += 1
    end
  end

  subs_array.map! { |sub| sub.reduce(&:+)}.max
  #(num of arrays) * (time to reduce     ) + (time for max)
end

list = [5, 3, -7]
largest_contiguous_subsum(list)

#
# Phase II
#
# Let's make a better version. Write a new function using O(n) time
# with O(1) memory. Keep a running tally of the largest sum.

# => O(n) = n && O(1) memory
def largest_contiguous_subsum_better(array)
  sum = 0
  max = 0
  max_idx = 0
  array.each_with_index do |el, idx|
    sum += el
    if sum > max
      max = sum
      max_idx = idx
    end
  end

  sum = 0
  max_idx.downto(0) do |j|
    sum += array[j]
    if sum > max
      max = sum
    end
  end

  max
end
# list = [2, 3, -6, 7, -6, 7]
list = [-10, -10, 10, 10, 5, -1]
p largest_contiguous_subsum_better(list)

p largest_contiguous_subsum_better([5, 3, -7])

p largest_contiguous_subsum_better([5, 3])
