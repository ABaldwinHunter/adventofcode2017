def captcha(num)
  nums = num.to_s.split("").map(&:to_i)
  sum = 0

  for i in 0..(nums.length - 1)
    if (i == nums.length - 1) && nums[i] == nums[0]
      sum += nums[i]
    elsif nums[i] == nums[i+1]
      sum += nums[i]
    end
  end
end

def captcha(num)
  nums = num.to_s.split("").map(&:to_i)
  halfway = nums.length / 2
  sum = 0

  for i in 0..(nums.length - 1)
    if (i == nums.length - 1) && nums[i] == nums[0]
      sum += nums[i]
    elsif nums[i] == nums[i+1]
      sum += nums[i]
    end
  end
end
