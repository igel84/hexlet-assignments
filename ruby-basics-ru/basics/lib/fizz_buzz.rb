# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return if start > stop

  result = []
  start.upto(stop) do |i|
    result << if (i % 3).zero? && (i % 5).zero?
                'FizzBuzz'
              elsif (i % 3).zero?
                'Fizz'
              elsif (i % 5).zero?
                'Buzz'
              else
                i.to_s
              end
  end

  result.join(' ')
end
# END
