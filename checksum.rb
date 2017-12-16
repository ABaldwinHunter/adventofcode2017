def checksum(rows)
  # for each row, find the max diff.
  # then add.
end

def max_diff(row) # row is an array of nums [1, 2, 3, 4]
  # return difference between largest and smallest row item
end

# [ [1,2,3,4], [1,2,3,4] ]
#
#
def division(row)
  divisor = nil
  top = nil
  row.each_with_index do |num, i|
    divisor = num
    row.each_with_index do |n, index|
      if index == i
      elsif n % divisor == 0
        top = n
        return (top / divisor)
      end
    end
  end
end
