def bad_two_sum?(array, target)
  array.each_with_index do |val1, i|
    array.each_with_index do |val2, j|
      next if i == j
      return true if target == val1 + val2
    end
  end
  false
end

arr = [0, 1, 5, 7]
arr = [-1,0,2,5,7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10)

# O(n) = nlogn because of bsearch
def okay_two_sum?(array, target)
  array.each do |val|
    val2 = array.bsearch { |x| val + x == target }
    return true if !val2.nil? && val + val2 == target
  end
  false
end

# ask TA what's up with bsearch not finding current value
#
# p okay_two_sum?(arr,6)
# p okay_two_sum?(arr,10)

def big_guns_two_sum?(array, target)
  hash = Hash.new{ |h, k| h[k] = false}

  array.each do |val|
    hash[val] = true
  end

  hash.each_key do |key|
    val2 = target - key
    return true if key != val2 && hash.key?(val2)
  end

  false
end

arr = [-1,-2,3,4,-3,5]
p big_guns_two_sum?(arr,-5)
p big_guns_two_sum?(arr,-3)
