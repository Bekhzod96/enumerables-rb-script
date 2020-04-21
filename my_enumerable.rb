# rubocop:disable all

module Enumerable
  def my_each
    return to_enum :my_each unless block_given?
    for item in self
        yield(item)
    end
  end

  def my_each_with_index
    return to_enum :my_each unless block_given?
    index = 0
    for item in self
      yield(item, index)
      index+=1
    end
  end

  def my_select
    return to_enum :my_each unless block_given?
     result =[]
    for item in self
        result.push(item) if yield(item) == true
   end
   result
 end

  def my_any?(args = nil)
    result = false
    unless args.nil?
      if is_a? Hash
        my_each do |_item, value|
        break result = false unless value.class == args end
      elsif args.is_a? Regexp
        my_each do |value| 
          break p result = true  unless (value =~ args).nil?        
        end
      elsif (args == String) || (args == Integer) ||  (args == Float) ||  (args == Numeric)
        my_each do |value| 
          break result = true if value.class == args  
        end
      else
        my_each do |value|
        break result = true if value == args end
      end
    end

    if !block_given? 
      if is_a? Hash
        my_each do |item|
        break result = true if item[1] == true end
      else
        my_each do |item|
        break result = true if item == true end
      end
    else
      if is_a? Hash
        my_each do |item, value|
        break result = true if yield(item, value) == true end
      else
        my_each do |value|
          break result = true if yield(value) == true  end
      end
    end
    result
  end

  def my_all?(args = nil)
    result = true
    unless args.nil?
      if is_a? Hash
        my_each do |_item, value|
        break result = false unless value.class == args end
      elsif args.is_a? Regexp
        my_each do |value| 
          result = false  if (value =~ args).nil?        
        end
      elsif (args == String) || (args == Integer) ||  (args == Float) ||  (args == Numeric)
        my_each do |value| 
          break result = false unless value.class == args  
        end
      else
        my_each do |value|
        break result = false unless value == args end
      end
    end
    unless block_given? && args.nil?
      if is_a? Hash
        my_each do |item|
        result = false if item[1] == false || item[1].nil? end
      else
        my_each do |item|
        result = false if item == false || item.nil? end
      end
    else
      if is_a? Hash
        my_each do |item, value|
        break result = false if yield(item, value) == false || yield(item, value).nil? end
      else
        my_each do |value|
          break result = false if yield(value) == false || yield(value).nil?
        end
      end
    end
    result
  end

  def my_none?(args = nil)
    result = true
    unless args.nil?
     if is_a? Hash
        my_each do |_item, value|
        break result = false unless value.class == args end
     elsif args.is_a? Regexp
        my_each do |value| 
          break result = false  unless (value =~ args).nil?        
        end
     elsif (args == String) || (args == Integer) ||  (args == Float) ||  (args == Numeric)
        my_each do |value| 
          break result = false if value.class == args  
        end
      else
        my_each do |value|
        break result = false if value == args end
      end
    end
    unless block_given? && args.nil?
      if is_a? Hash
        my_each do |item|
        result = false if item[1] == true end
      else
        my_each do |item|
        result = false if item == true end
      end
    else
      if is_a? Hash
        my_each do |item, value|
        break result = false if yield(item, value) == true end
      else
        my_each do |value|
          break result = false if yield(value) == true
        end
      end
    end
    result
  end

  def my_count(args = nil)
    result = size
    count = 0
    if !args.nil?
      my_each do |item|
      item == args ? count += 1 : nil end
      result = count
    elsif block_given?
      my_each do |item|
      count += 1 if yield(item) == true end
      result = count
    end
    result
  end

  def my_map
    result = []
    return to_enum :my_map unless block_given?
      my_each do  |item| 
        result.push(yield(item)) end
      return result 
  end

  def my_inject(*arg)
    result = nil
    sign = nil

    if arg.length == 2
      result = arg[0]
      sign = arg[1]
      my_each do |item|
        result = result.send(sign, item)
      end
    elsif arg[0].is_a? Symbol
      sign = arg[0]
      my_each do |item|
        result = (result ? result.send(sign, item) : item)
      end
    else
      result = arg[0]
      my_each do |item|
        result = (result ? yield(result, item) : item)
      end
    end

    result
  end
  
  # rubocop:enable all
end

def multiply_els
  inject { |item| item * item }
end
