class LinkedList 
    attr_accessor :head,:tail
  
    def initialize
     self.head = nil
     self.tail = nil
    end

    def append(value)
        node = Node.new(value)
        if self.head == nil
            self.head = node
        end
        unless self.tail == nil
            self.tail.next_node = node
        end
        self.tail = node
    end

    def prepend(value) 
        node = Node.new(value)
        unless self.head == nil
            self.head = node
        end
        if self.tail == nil
           self.tail = node
        end 
    end

    def size
        i = 0
        node = head
        while node != nil
            i += 1
            node = node.next_node
        end
        i
    end

    def at(index)
        node = head
        index.times do
            while node.next_node != nil
            node = node.next_node
            end
        end
        node
    end

    def pop
        node = head
        while node.next_node != self.tail
            node = node.next_node
        end
        removed = node.next_node
        node.next_node = nil
        self.tail = node
        removed
    end

    def contains(value)
        node = self.head
        while node != nil
            if node.value == value
                return true
            end
            node = node.next_node
        end
        return false
    end

    def find(value)
        i = 0
        node = self.head
        while node != nil
            if node.value == value
        return i
            end
            node = node.next_node
            i += 1
        end
        return nil
    end

    def to_s
        node = self.head
        while node != nil
            print "(#{node} ->)"
            node = node.next_node
        end
    end
end

class Node 
    attr_accessor :value, :next_node
    
    def initialize(value = nil, next_node = nil)
      self.next_node = next_node
      self.value = value
    end
end
  

list = LinkedList.new

list.append(10)
list.append(29)
list.append(40)
puts list.at(1)
#list.pop()
puts list.contains(101)
puts list.size
puts list.to_s
puts list.head.value
puts list.tail.value
puts list.head.next_node.value
#puts list.find(10)
#puts list.find(20)
#puts list.find(5)