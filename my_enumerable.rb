
# rubocop:disable all
module Enumerable
  def my_each
    for item in self
      yield(item)
    end
  end

  def my_each_with_index
    for item in self
      yield(item, index(item))
    end
  end

  def my_select
    for element in self
      yield(element)
   end
 end

  def my_any?(args = nil)
    result = true
    if !block_given? && args.nil?
      empty? ? result = false : nil
      my_each do |item|
        if is_a? Hash
          result = false if item[1] == false || item[1].nil?
        elsif item.nil?
          result = false
        else
          result = false if item == false || item.nil?
        end
      end
      result
    else
      my_select { |key, value| yield(key, value) } if is_a? Hash
      my_each { |key| yield(key) }
    end
  end

  def my_all?(args = nil)
    result = true
    unless args.nil?
      if is_a? Hash
        my_each do |_item, value|
        break result = false unless value.class == args end
      else
        my_each do |_value|
        break result = false unless item.class == args end
      end
    end
    unless block_given?
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
      else
        my_each do |_value|
        break result = false unless item.class == args end
      end
    end
    unless block_given?
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
        p yield(item, value) == true
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
    for i in self
      i = yield(i) if block_given?
      result.push(i)
    end
    result
  end

  def my_inject(args = -1)
    memo = 0
    if is_a? Range
      count = -1
      for i in self
        count += 1
        next if count < args
        memo = yield(memo, i)
      end
    else
      stor = ''
      my_each do |item|
        stor = yield(stor, item) end
      memo = stor
    end
    memo
  end

  # rubocop:enable all
  def multiply_els
    inject { |item| item * item }
  end
end
