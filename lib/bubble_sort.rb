#!/usr/bin/env ruby



def bubble_sort(array)
  n = array.length
  (n - 1).times do |i|
    (n - i - 1).times do |a|
      if array[a] > array[a + 1]
        array[a], array[a + 1] = array[a + 1], array[a] 
      end
    end
  end
  p array
end

arr = [4, 3, 78, 2, 0, 2]

bubble_sort(arr)
