require "byebug"

def range(start_num, end_num)
  return [] if end_num <= start_num

  range(start_num + 1, end_num).unshift(start_num)
end

def exp_1(base, exponent)
  return base if exponent == 1
  return 1 if exponent == 0

  base * exp_1(base, exponent - 1)
end

def exp_2(base, exponent)
  return base if exponent == 1
  return 1 if exponent == 0

  if exponent.even?
    exp_2(base, exponent / 2) ** 2
  elsif exponent.odd?
    base * (exp_2(base, (exponent - 1) / 2) ** 2)
  end

end

def deep_dup(array)
  return [[array]] if !array.is_a?(Array)
  duplicate = []
  array.each do |subarray|
    if subarray.is_a?(Array)
      duplicate << deep_dup(subarray)
    else
      duplicate << subarray
    end
  end
  duplicate 
end


def fibonacci(n)
  return [1] if n == 1
  return [1, 1] if n == 2

  previous_fibonacci = fibonacci(n - 1) 

  previous_fibonacci << previous_fibonacci[-1] + previous_fibonacci[-2]

  previous_fibonacci
end


def bsearch(array, target)
  middle_index = array.length / 2

  return nil if array.empty?

  return middle_index if array[middle_index] == target

  if array[middle_index] > target
    test = bsearch(array[0...middle_index], target)
    
  elsif array[middle_index] < target
     
    test = bsearch(array[middle_index + 1..-1], target)
    if test.nil?
      return nil
    else
      test + middle_index + 1
    end
  end
  
end


def merge_sort(array)
  return array if array.length == 1

  middle = array.length / 2

  left = merge_sort(array[0..middle])
  
  right = merge_sort(arr[middle+1..-1])



end

def compare_elements(num1, num2)


end

def compare(left_array, right_array)
  combined = []
  left_array.each_with_index do |ele, i|
    if left_array[i] > right_array[i]

      combined << right_array[i] > left_array[i]
      
    else
      combined << left_array[i] 
      combined << right_array[i]
    end
  end
  combined
end