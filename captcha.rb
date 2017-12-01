def captcha(num)
  nums = num.to_s.split("").map(&:to_i)
  first = nums[0]
  last = nums[0]

  repeats = []

  nums.each_with_index do |n, i|
    if i == 0
      # do nothing
    elsif n == last
      repeats << last
    end
    last = n
  end

  if last == first
    repeats << last
  end

  repeats.inject(:+)
end
