# Phase I:
#
# Write a method #first_anagram? that will generate
# and store all the possible anagrams of the first string.
# Check if the second string is one of these.

### O(n) = n! because permutations (n*n!)
def first_anagram?(string, string2)
  # use permutation
  # this works because the length has to be equal
  # see if p_array includes? string

  str_arr = string.split('')
  perm_arr = str_arr.permutation(str_arr.length).to_a

  str2_arr = string2.split('')
  return true if perm_arr.include?(str2_arr)
  false
end

first_anagram?('elvis', 'lives')
first_anagram?('gizmo', 'sally')


# Phase II:
# Write a method #second_anagram? that iterates over both
# strings. As you find letters that appear in both words, delete
# them one at a time. They are anagrams if both the strings
# are empty at the end.
#
# Try varying the length of the input strings. What are the
# differences between #first_anagram? and #second_anagram??

### O(n) = n^2 / quadratic because of nested while loops
def second_anagram?(string, string2)
  str1_arr = string.split('')
  str2_arr = string2.split('')

  i = 0
  while i <= str1_arr.length
    j = 0
    while j < str2_arr.length
      if str1_arr[i] == str2_arr[j]
        str1_arr.delete_at(i)
        str2_arr.delete_at(j)
        i -= 1
        break
      end
      j += 1
    end
    i += 1
  end

  return true if str1_arr.empty? && str2_arr.empty?
  false
end

# p second_anagram?('elvis', 'lives')
# p second_anagram?('gizmo', 'sally')

# Write a method #third_anagram? that solves the problem by sorting
#  both strings alphabetically. The strings are then anagrams if and only
#  if the sorted versions are the identical.

### O(n) = nlogn
def third_anagram?(string1, string2)
  string1.split('').sort == string2.split('').sort
end

# p third_anagram?('elvis', 'lives')
# p third_anagram?('gizmo', 'sally')
# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes
# to store the number of times each letter appears in both words.
# Compare the resulting hashes.

### O(n) = n / linear && O(2n) memory
def fourth_anagram?(string1, string2)
  hash1 = Hash.new{|h,k| h[k] = 0}
  hash2 = Hash.new{|h,k| h[k] = 0}

  string1.each_char do |char|
    hash1[char] += 1
  end

  string2.each_char do |char|
    hash2[char] += 1
  end

  hash1 == hash2
end

### O(n) = n && O(1) memory
def fourth_anagram_bonus?(string1, string2)
  hash = Hash.new{|h,k| h[k] = 0}

  string1.each_char do |char|
    hash[char] += 1
  end

  string2.each_char do |char|
    hash[char] -= 1 if hash.key?(char)
  end

  hash.all?{|k,v| v == 0 }
end

p fourth_anagram_bonus?('elvis', 'lives')
p fourth_anagram_bonus?('gizmo', 'sally')
