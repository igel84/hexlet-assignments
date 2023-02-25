# frozen_string_literal: true

# BEGIN
def reverse(str)
  result = ''
  str.each_char { |s| result = s + result }
  result
end
# END
