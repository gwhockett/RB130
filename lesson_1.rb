=begin
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
    description == otherTodo.description &&
    done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title
  attr_reader :todos

  private :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def done?
    todos.all? { |item| item.done? }
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    todos << todo
  end

  alias_method :add, :<<

  def item_at(idx)
    #todos[idx]: this does not raise an error if index is out of range
    # `#fetch` will raise an error

    todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    todos.map(&:done!) # this is not correct, do not return a new array
  end

  def remove_at(idx)
    todos.delete(item_at[idx])
  end

  def to_s
    str = "---#{title}---\n"
    str << todos.map(&:to_s).join("\n")
    #idx = 0
    #while idx < todos.size
    #  str += "\n#{todos[idx]}"
    #  idx += 1
    #end
    str
  end

  def to_a
    todos.clone
  end

  def each
    todos.to_a.each do |todo|
      yield(todo)
    end

    self
  end

  def select
    selected_list = TodoList.new(title)
  
    each do |todo|
      selected_list << todo if yield(todo)
    end
  
    selected_list
  end

  def find_by_title(title_needed)
#    title_found = nil
#
#    each do |todo|
#      if todo.title == title_needed
#        title_found = todo
#        break
#      end
#    end
#
#    title_found
    select {|todo| todo.title == title_needed}.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title_needed)
#    find_by_title(title_needed).done! if find_by_title(title_needed)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.mark_all_undone

puts list.all_done
puts list.all_not_done
=end
# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description=' ')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
    description == otherTodo.description &&
    done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end
  
  def each
    @todos.each { |item| yield item }
    self
  end

  def select
    result = TodoList.new("#{title}")
    each { |item| result.add(item) if yield item }
    result
  end

  def all_done
    select(&:done?)
  end

  def all_not_done
    select { |item| !item.done? }
  end

  def find_by_title(todo_title)
    matching_title = nil
    each { |item| matching_title = item if item.title == todo_title }
    matching_title
  end

  def mark_done(todo_title)
    find_by_title(todo_title) && find_by_title(todo_title).done!
  end

  def mark_all_done
    each(&:done!)
  end

  def mark_all_undone
    each(&:undone!)
  end

  def add(todo)
    unless todo.instance_of? Todo
      raise TypeError, 'can only add Todo objects'
    end
    @todos.push(todo)
  end

  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.to_a
  end

  def done?
    @todos.all?(&:done?)
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each(&:done!)
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    "---- #{title} ----\n" + @todos.map(&:to_s).join("\n")
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

p list.mark_done("How")

