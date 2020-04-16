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

  def my_inject(arg=nil,sym=nil)
    memo = 1
    if !block_given? 
      case sym
      when :*
       my_each {|item| memo *= item} 
      when :+
        memo = 0
        my_each {|item| memo += item} 
      when :/
        my_each {|item| memo /= item} 
      else
        p "Invalid value"
      end
    else
      my_each do |item| memo = yield(memo, item) end
    end
    !arg.nil? ? memo*=arg :  memo
  end
  
  # rubocop:enable all
  def multiply_els
    inject { |item| item * item }
  end
end
