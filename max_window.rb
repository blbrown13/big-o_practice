def naive_window_max(array, window_size)
  current_max_range = nil

  perms_array = array.permutation(window_size).to_a

  max = 0
  perms_array.each do |sub_array|
    sub_max = sub_array.max - sub_array.min
    max = sub_max if sub_max > max
  end

  max
end

p naive_window_max([1, 0, 2, 5, 4, 8], 2) == 4
