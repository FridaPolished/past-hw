class Stack
    def initialize
      @stack_storage = []
    end

    def push(el)
      @stack_storage.push(el)
    end

    def pop
       @stack_storage.pop 
    end

    def peek
      @stack_storage[-1]# returns, but doesn't remove, the top element in the stack
    end
  end

  # p stack = Stack.new
  # p stack.push(1) #[1]
  # p stack.push(2) #[1,2]
  # p stack.push(3) #[1,2,3]
  # p stack.push(4) #[1,2,3,4]
  
  # p stack.peek #4
  # p stack.pop #4
  # p stack.pop #3
  # p stack #[1, 2]


class Queue
    def initialize
      @queue = []
    end

    def enqueue(el)
      @queue << el
    end

    def dequeue
      @queue.shift
    end

    def peek
      @queue[0]
    end
end

# p queue = Queue.new
# p queue.enqueue(1)
# p queue.enqueue(2)
# p queue.enqueue(3)
# p queue.enqueue(4)
# p queue
# p queue.dequeue #1
# p queue
# p queue.peek #2

class Map
    def initialize
      @map = []
    end
    
    def set(key,value)
       return @map << [key, value] if @map.empty?

        @map.each_index do | i|
          if @map[i][0] == key
            return @map[i][1] = value
          else 
            return @map << [key, value]
          end
        end
    end

    def get(key)
      @map.each do |sub| 
        sub if sub.include?(key)
      end
    end

    def delete(key)
      @map.each_with_index do |sub, i|
        if sub[0] == key
            @map.delete_at(i)
        end
      end
    end

    def show
      @map
    end

end 

# p mapo = Map.new
# #p initialize
# p mapo.set(4, "lino")
# #p mapo.show
# p mapo.set(5, "gobo")
# #p mapo.show
# p mapo.set(4, "tila")
# #p mapo.delete(5)
# p mapo.show

