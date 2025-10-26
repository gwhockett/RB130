=begin

class Element
  attr_reader :datum, :next

  def initialize(data, next_ele=nil)
    @datum = data
    @next = next_ele
  end

  def tail?
    #!@next_ele.is_a?(Element)
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def empty?
    #!@head.is_a?(Element)
    @head.nil?
  end

  def size
    size = 0
    current_element = @head
    while current_element#.is_a?(Element)
      size += 1
      current_element = current_element.next
    end
    size
  end
  
  def pop
    current_head = @head
    @head = @head.next
    current_head.datum
  end

  def push(obj) #, obj2=nil)
    #if @head == nil
    #  @head = Element.new(obj, obj2)
    #else
    #  @head = Element.new(obj, @head)
    #end

    @head = Element.new(obj, @head)
  end

  def peek
    #return nil if empty?
    @head.datum if @head
  end

  def to_a
    result = []
    current_element = @head
    while current_element.is_a?(Element)
      result.append(current_element.datum)
      current_element = current_element.next
    end
    result
  end

  def self.from_a(linked_list)
    new_list = SimpleLinkedList.new
    linked_list = [] unless linked_list.is_a?(Array)
    linked_list.reverse_each { |obj| new_list.push(obj) }
    new_list
  end

  def reverse
    new_list = SimpleLinkedList.new
    current_element = @head
    while current_element.is_a?(Element)
      new_list.push(current_element.datum)
      current_element = current_element.next
    end
    new_list
  end
end

=end

class Element
  attr_reader :next, :datum

  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def self.from_a(ary)
    new_list = new
    return new_list if !ary
    ary.reverse.each do |obj|
      new_list.push(obj)
    end
    new_list
  end

  def to_a
    result = []
    current_element = @head
    while current_element
      result << current_element.datum
      current_element = current_element.next
    end
    result
  end

  def push(obj)
      @head = Element.new(obj, @head)
  end

  def pop
    current_element = @head
    @head = @head.next
    current_element.datum
  end

  def size
    return 0 if empty?
    list_size = 1
    current_element = head
    while current_element.next
      list_size += 1
      current_element = current_element.next
    end
    list_size
  end

  def empty?
    head.nil?
  end

  def peek
    empty? ? head : head.datum
  end

  def reverse
    new_list = SimpleLinkedList.new
    current_element = head
    while current_element
      new_list.push(current_element.datum)
      current_element = current_element.next
    end
    new_list
  end
end
