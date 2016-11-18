class Queue
  
  def initialize
    @ivar = []
  end

  def enqueue(el)
    @ivar.unshift(el)
  end

  def dequeue
    @ivar.shift
  end

  def show
    ivar = @ivar
  end
end