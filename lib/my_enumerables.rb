module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0

    my_each do |val|
      yield(val, i)
      i += 1
    end

    self
  end

  def my_select
    selected_array = []

    my_each do |val|
      selected_array.push(val) if yield(val)
    end

    selected_array
  end

  def my_all?
    bool = true

    my_each do |val|
      bool = false unless yield(val)
    end

    bool
  end

  def my_any?
    bool = false

    my_each do |val|
      bool = true if yield(val)
    end

    bool
  end

  def my_none?(&block)
    !my_any?(&block)
  end

  def my_count(&block)
    return length if block.nil?

    my_select(&block).length
  end

  def my_map
    mapped_array = []

    each do |val|
      mapped_array.push(yield(val))
    end

    mapped_array
  end

  def my_inject(initial_value = self[0])
    sum = initial_value

    array = self
    array = array[1..] if initial_value == self[0]

    array.my_each do |val|
      sum = yield(sum, val)
    end

    sum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in (0...length)
      yield(self[i])
    end

    self
  end
end

class Hash
  def my_each
    for i in keys
      yield(i, self[i])
    end

    self
  end
end
