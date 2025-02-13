class CustomSet
  attr_reader :set

  def initialize(array=[])
    array.nil? ? @set = [] : @set = array.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(obj)
    set.any?(obj)
  end

  def subset?(other)
    #set.all? { |ele| other.set.any?(ele) }
    set.all? { |ele| other.contains?(ele) }
  end

  def disjoint?(other)
    #!(set.any? { |ele| other.set.any?(ele) })
    set.none? { |ele| other.contains?(ele) }
  end

  def eql?(other)
    #set.sort.eql?(other.set.sort)
    set.all? { |ele| other.contains?(ele) } &&
    set.size == other.set.size
  end

  def add(obj)
    set << obj unless contains?(obj)
    self
  end

  def intersection(other)
    #CustomSet.new(set.intersection(other.set))
    new_set = set.select { |obj| other.contains?(obj) }
    CustomSet.new(new_set)
  end

  def difference(other)
    #CustomSet.new(set.difference(other.set))
    new_set = set.select { |obj| !other.contains?(obj) }
    CustomSet.new(new_set)
  end

  def union(other)
    #CustomSet.new(set.union(other.set).sort)
    union_set = CustomSet.new(set)
    other.set.each { |ele| union_set.add(ele) }
    union_set.set.sort!
    union_set
  end

  def ==(other)
    set == other.set
  end
end