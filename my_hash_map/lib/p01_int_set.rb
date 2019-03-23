class MaxIntSet
  attr_reader :store 

  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    raise "Out of bounds" if num > store.length  || num < 0
    @store[num] = true  
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    return true if @store[num] == true 
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end

end


class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless self[num].include?(num)
  end

  def remove(num)
    self[num].reject! { |i| i == num }
  end

  def include?(num)
    self[num].include?(num)
  end

  def []=(num, el)
    @store[num % store.length] = el
  end

  def [](num)
    @store[num % store.length]
  end

  private

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store 

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if self.include?(num) == false 
      @store[num % store.length] << num
      self.count += 1
      resize! if self.count == store.length
    end
  end

  def remove(num)
    self[num].each_with_index do |ele, i|
      if ele == num 
        self[num] = self[num].take(i) + self[num].drop(i+1)
        @count -= 1
      end
    end
  end

  def include?(num)
    self.[](num).include?(num)
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % store.length]
  end

  def []=(num, ele)
    @store[num % store.length] = ele
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_set = ResizingIntSet.new(num_buckets * 2)
    (0...num_buckets).each do |i|
      @store[i].each do |num|
        new_set.insert(num)
      end
    end
    @store = new_set.store
  end
end

def hashing_fn(input)
  

end