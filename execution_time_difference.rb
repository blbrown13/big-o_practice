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
  return array[0] if array.size <= 1

  largest_sum = array[0] + array[1]

  array.each_with_index do |val, idx|
    break if idx == array.length - 2
    sum = val + array[idx+1] + array[idx+2]
    largest_sum = sum if sum > largest_sum
  end

  largest_sum
end
# list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_better(list)

p largest_contiguous_subsum_better([5, 3])
