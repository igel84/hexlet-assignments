# frozen_string_literal: true

# BEGIN
def get_same_parity(arr)
  return [] if arr.empty?
  arr.filter{|a| arr.first.even? ? a.even? : a.odd?  }
end
# END
