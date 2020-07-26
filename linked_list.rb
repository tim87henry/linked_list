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

llist.append(44)
llist.append(55)
llist.append(66)
puts llist

llist.prepend(99)
puts llist
puts "Size of the linked list is #{llist.size}"
llist.head
llist.tail
llist.at(2)

llist.append(77)
puts llist
llist.pop
puts llist
puts "Does it contain 77? #{llist.contains?(77)}"
puts "Does it contain 55? #{llist.contains?(55)}"
puts "Index of 55 is #{llist.find(55)}"