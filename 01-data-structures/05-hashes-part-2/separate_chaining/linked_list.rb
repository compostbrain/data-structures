require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if self.head == nil
      self.head = node
    end
    if self.tail
      self.tail.next = node
    end
    node.next = nil
    self.tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current_tail = self.tail
    current_head = self.head
    if current_head != current_tail
      current = self.head
      until current.next == current_tail
        current = current.next
      end
      current.next = nil
      self.tail = current
    else
      self.tail = nil
      self.head = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    current_head = self.head
    current_tail = self.tail
    if current_head == current_tail
      puts "The linked list has one member: #{current_head.data}"
    else
      current = current_head
      string = ""
      until current == current_tail
        string += "#{current.data}\n"
        current = current.next
      end
      string += "#{current.data}\n"
      puts string
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if self.head == node
      remove_front
    elsif self.tail == node
      remove_tail
    else
      current = self.head
      while current.next != node
        current = current.next
      end
      current.next = node.next
      node.next = nil
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = self.head
    self.head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = self.head
    self.head = self.head.next
    return temp
  end
end
