# frozen_string_literal: true

# BEGIN
def compare_versions(ver1, ver2)
  return 0 if ver1.to_f == ver2.to_f
  
  if ver1.to_i > 0 || ver2.to_i > 0
    ver1.to_i > ver2.to_i ? 1 : -1
  elsif ver1[2..].to_i > ver2[2..].to_i
    1
  else
    -1
  end
end
# END
