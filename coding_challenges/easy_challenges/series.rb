class Series
  def initialize(str)
    @input_str = str
  end

  def slices(slice_length)
    raise ArgumentError.new if slice_length > @input_str.size
    @input_str.chars.map(&:to_i).each_cons(slice_length).to_a
    #(0...@input_str.size).each do |first_idx|
    #  slice = @input_str[first_idx, slice_length].chars
    #  break if slice.size < slice_length
    #  @slices << slice.map(&:to_i)
    #end
    #@slices
  end
end

series = Series.new('01234')
p series.slices(2)