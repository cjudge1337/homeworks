class Map
  
  def initialize
    @map = []
  end

  def assign(key, val)
    @map << [key, val] if self.lookup(key).nil?
    
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
    
  end

  def show
   
  end
end