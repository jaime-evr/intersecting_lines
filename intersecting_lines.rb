require 'pry'

def merge_lines(arr)
  previous_elem = arr[0]
  result_arr = []

  arr.each_with_index do |item, index|
    next if index == 0

    if item[0] <= previous_elem[1]
      merged_lines = previous_elem + item
      previous_elem = [merged_lines.min, merged_lines.max]
    else
      result_arr << previous_elem
      previous_elem = item
    end
  end

  result_arr << previous_elem

  result_arr
end

=begin
       ----
   ----
  ---
 --
=end
merge_lines([[1,2], [2,4], [3,6], [7,10]]) # => [[1,6], [7,10]]

=begin
  --
 --
=end
merge_lines([[1,2], [2,3]]) # => [[1, 3]]

=begin
   --------
 ----
=end
merge_lines([[1,4], [3,10]]) # => [[1, 10]]

=begin
 ----------
  ---
=end
merge_lines([[2,4], [1, 10]]) # => [[1, 10]]

=begin
       ----
      -
  --
 ------
=end
merge_lines([[1,6], [2,3], [6,6], [7,10]]) # => [[1,6], [7,10]]

=begin
      -----
    --
   -
 --
=end
merge_lines([[1,2], [3,3], [4,5], [6,10]]) # => [[1,2], [3,3], [4,5], [6,10]]

=begin
   ---
  ---------
 ---
=end
merge_lines([[1,3], [2,10], [3,5]]) # => [[1,10]
