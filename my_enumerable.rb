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

end