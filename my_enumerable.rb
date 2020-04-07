module Enumerable
  def my_each
    #iterat over the self and send back it to block
    for item in self
      yield(item)
    end
  end

  def my_each_with_index
    #returns index of the item
    for item in self
      yield(item, self.index(item))
    end
  end

  def my_select 
    #select method working the same as each
    for element in self
     yield(element)
   end
 end

end