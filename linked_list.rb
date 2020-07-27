class LinkedList
    @@nodes=[]
    @@tempo=[]
    def initialize
        puts "Init ..."
    end

    def append(num)
        @@tempo.push(num)
        node=Node.new(num)
        @@nodes.push(node)
        if @@nodes.length>1
            @@nodes[@@nodes.length-2].next_node=node
        end
    end

    def prepend(num)
        head=@@nodes[0]
        node=Node.new(num)
        node.next_node=head
        temp_nodes=[]
        temp_nodes[0]=node
        for i in 1..@@nodes.length
            temp_nodes[i]=@@nodes[i-1]
        end
        @@nodes=temp_nodes
    end

    def size
        return @@nodes.length
    end

    def head
        if @@nodes.empty?
            puts "The list is empty"
            return
        else 
            puts "The value of first node is : #{@@nodes[0].value}"
            return @@nodes[0]
        end
    end

    def tail
        if @@nodes.empty?
            puts "The list is empty"
            return
        else 
            puts "The value of last node is : #{@@nodes[@@nodes.length-1].value}"
            return @@nodes[@@nodes.length-1]
        end
    end

    def at(index)
        if @@nodes.length-1 < index
            puts "The number is out of bounds"
            return
        else
            puts "The value of the node at index #{index} is #{@@nodes[index].value}"
            return @@nodes[index]
        end
    end

    def pop
        last_node=@@nodes.length-1
        @@nodes=@@nodes.slice(0,last_node)
        @@nodes[last_node-1].next_node=nil
    end

    def contains?(value)
        for i in 0..@@nodes.length-1
            if @@nodes[i].value==value
                return true
            end
        end
        return false
    end

    def find(value)
        for i in 0..@@nodes.length-1
            if @@nodes[i].value==value
                return i
            end
        end
        return nil
    end

    def to_s
        string=""
        for i in 0..@@nodes.length-1
            string +="("
            string += @@nodes[i].value.to_s
            string += ")"
            unless i == @@nodes.length-1
                string += " -> "
            end
        end
        return string
    end

    def insert_at(value, index)
        if index>@@nodes.length
          puts "The index is out of range"
          return
        end
        node=Node.new(value)
        temp_nodes=[]
        for i in 0..index-1
            temp_nodes[i]=@@nodes[i]
        end
        temp_nodes[index]=node
        for i in index..@@nodes.length-1
            temp_nodes[i+1]=@@nodes[i]
        end
        if index<@@nodes.length
          temp_nodes[index].next_node=temp_nodes[index+1]
        else
          temp_nodes[index].next_node=nil
        end
        unless index==0
          temp_nodes[index-1].next_node=node
        end
        @@nodes=temp_nodes
    end
  
    def remove_at(index)
        if index>=@@nodes.length
          puts "The index is out of range"
          return
        end
        temp_nodes=[]
        for i in 0..index-1
          temp_nodes[i]=@@nodes[i]
        end
        for i in index..@@nodes.length-2
          temp_nodes[i]=@@nodes[i+1]
        end
        if index=@@nodes.length-1
          temp_nodes[temp_nodes.length-1].next_node=nil
        elsif index>0
          temp_nodes[index-1].next_node=temp_nodes[index]
        end
        @@nodes=temp_nodes
    end

end

class Node
    attr_accessor :value
    attr_accessor :next_node
    def initialize(value)
        @value = value
        @next_node = nil
    end
end

llist=LinkedList.new()
puts "Added three elements 44,55 and 66"
llist.append(44)
llist.append(55)
llist.append(66)
puts llist

puts "Prepended element 99"
llist.prepend(99)
puts llist
puts "Size of the linked list is #{llist.size}"
llist.head
llist.tail
llist.at(2)

puts "Appending element 77"
llist.append(77)
puts llist
puts "Popping element 77"
llist.pop
puts llist
puts "Does it contain 77? #{llist.contains?(77)}"
puts "Does it contain 55? #{llist.contains?(55)}"
puts "Index of 55 is #{llist.find(55)}"

puts "Inserting element 88 at index 7"
llist.insert_at(88,7)
puts llist
puts "Inserting element 88 at index 4"
llist.insert_at(88,4)
puts llist

puts "Removing element at index 0"
llist.remove_at(0)
puts llist