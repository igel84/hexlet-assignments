# frozen_string_literal: true

# BEGIN
def fibonacci(num)
  return nil if num.negative?
  return 0 if num.zero?
  return 1 if num == 1

  prev1 = prev2 = result = 1
  (num - 2).times do
    result = prev1 + prev2
    prev1 = prev2
    prev2 = result
  end
  result
end
# END
