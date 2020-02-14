# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  0 if arr.length == 0
  sum = 0
  arr.each do |x|
    sum = sum + x
  end
  sum
end

def max_2_sum arr
  return 0 if arr.length == 0
  arr.sort!
  return arr[-1] if arr.length == 1
  return arr[-1] + arr[-2] if arr.length > 1
end

def sum_to_n? arr, n
  return false if arr.length == 0 or arr.length == 1
  arr = arr.sort!
  forward_index = 0
  backward_index = arr.length - 1
  arr.each do |x|
    return true if arr[forward_index] + arr[backward_index] == n
    if arr[forward_index] + arr[backward_index] < n
      forward_index += 1
      if forward_index >= arr.length - 1
        return false
      end
    elsif arr[forward_index] + arr[backward_index] > n
      backward_index -= 1
      if backward_index <= 0
        return false
      end
    end
  end
  return false
end

# Part 2

def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant? s
  return false if s == "" or s == " "
  s = s.downcase
  result = false
  if s[0] =~ /[a-z]/
    result = true
  else
    result = false
  end
  if result == false
    return result
  else
    if s[0] =~ /[aeiou]/
      result = false
    else
      result = true
    end
  end
  return result
end

def binary_multiple_of_4? s
  # convert the string into an integer
  num_length = s.length
  return false if num_length == 0
  if s.gsub(/[01]/,'') == ''
    full_num = 0
    power = num_length - 1
    chars = s.split('')
    chars.each do |x|
      int_val = x.to_i
      puts int_val
      full_num += int_val * 10**power
      power -= 1
    end
    if full_num % 4 == 0
      true
    else
      false
    end
  else
    false
  end
end

# Part 3

class BookInStock
  attr_accessor :isbn
  attr_accessor :price
  def initialize(isbn, price)
    if isbn == ""
      raise ArgumentError, 'ISBN cannot be empty'
    end
    if price <= 0
      raise ArgumentError, "Price cannot be negative"
    end
    @isbn = isbn
    @price = price
  end
  def price_as_string
    "$" + "%.2f" % @price
  end
end

book = BookInStock.new("amnvdhb", 22.9)
puts book.price_as_string
