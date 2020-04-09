module Enumerable
  def my_each
    for item in self
      yield(item)
    end
  end

  def my_each_with_index
    for item in self
      yield(item, self.index(item))
    end
  end

  def my_select 
    for element in self
     yield(element)
   end
 end

 def my_any?(args = nil)
  result = true
  if !block_given? && args == nil
    self.empty? ? result = false : nil 
    self.my_each{ |item|
     if is_a? Hash
      result = false if item[1] == false || item[1] == nil
    elsif item == nil
      result = false 
    else
      result = false if item == false || item == nil
     end 
    }
    result 
  else
    my_select { |key, value|  yield(key, value)  } if is_a? Hash
    my_each { |key|  yield(key) } 
  end
end

def my_all?(args = nil)
  result = true
  if !args.nil?
    if is_a? Hash
      my_each{ |item, value|
      break result = false unless value.class == args }
    else
      my_each{ |value|
      break result = false unless item.class == args}
    end 
  end
  unless block_given?
    if is_a? Hash 
      my_each { |item|
      result = false if item[1]  == false || item[1]  == nil }
    else 
      my_each { |item|
      result = false if item == false || item == nil  }
    end
  else
    if is_a? Hash
      my_each{ |item, value|
      break result = false if yield(item, value) == false || yield(item, value) == nil  }
    else
      my_each{ |value|
      break result = false if yield(value) == false || yield(value) == nil
    }
    end
  end
    result   
end

def my_none?(args = nil)
  result = true
  if !args.nil?
    if is_a? Hash
      my_each{ |item, value|
      break result = false unless value.class == args }
    else
      my_each{ |value|
      break result = false unless item.class == args}
    end 
  end
  unless block_given?
    if is_a? Hash 
      my_each { |item|
      result = false if item[1]  == true }
    else 
      my_each { |item|
      result = false if item == true  }
    end
  else
    if is_a? Hash
      my_each{ |item, value|
      p yield(item, value) == true
      break result = false if yield(item, value) == true }
    else
      my_each{ |value|
      break result = false if yield(value) == true
    }
    end
  end
    result   
end

def my_count(args=nil)
  result = self.size
  count = 0
  if !args.nil?
    my_each{|item|
    item == args ? count+=1 : nil }
    result = count
  elsif block_given?
    my_each{|item|
    count +=1 if yield(item) == true}
    result = count
  end
  result
end

end