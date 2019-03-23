class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if self.include?(key) == false 
      self[key] << key 
      @count += 1
      resize! if count == num_buckets
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self[key].include?(key)
      self[key].delete(key)
      @count -= 1
      return true
    end
    false
  end

  private

  def [](num)
    self.store[num.hash % num_buckets] 
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_bucket = @store.dup
    @store = Array.new(count * 2) { Array.new }
    
    if count == num_buckets 
      new_bucket.each do |bucket|
        bucket.each do |el|
          @store[el] << el
        end
      end
    end

    @store

  end
end
