class Stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def push(el)
      # adds an element to the stack
      @stack.push(el)
    end

    def pop
      # removes one element from the stack
      if @stack.empty?
        return @stack
      else
        return @stack = @stack[0..-2]
      end
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack[-1]
    end
  end

  class Queue
    def initialize
        @q = []
    end
    def enqueue(el)
        @q << el
    end

    def dequeue
        if @q.empty?
            return @q 
        else
            return @q = @q[1..-1]
        end
    end

    def peek
        @q[0]
    end
  end

  class Map
    def initialize
        @map = []
    end

    def set(key, value)
        if self.keys.include?(key)
            @map[keys.index(key)][1] = value
        else
            @map << [key,value]
        end

    end

    def get(key)
        if keys.include?(key)
            @map.select {|pair| pair[0] == key}[0][1]
        else
            return nil
        end
    end

    def delete(key)
        @map.reject! {|pair| pair[0] == key}
    end 

    def show
        @map
    end

    def keys
        k = []
        @map.each {|pair| k << pair[0]}
        return k
    end

  end
