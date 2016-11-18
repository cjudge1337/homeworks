class Map
  
  def initialize(map = [])
    @map = map
  end

  def assign(key, val)
    @map << [key, val] if self.lookup(key).nil?
    @map.map do |pair|
      if pair.first == key
        pair[1] = val
      end
    end
    @map
  end

  def lookup(key)
    @map.each do |pair|
      if pair.first == key
        return pair.last
      end
    end
    nil
  end

  def remove(key)
    return nil if self.lookup(key).nil?
    new_map = []
    @map.each do |pair|
      if pair.first != key
        new_map << pair
      end
    end
    @map = new_map
  end

  def show
    map = @map
  end
end