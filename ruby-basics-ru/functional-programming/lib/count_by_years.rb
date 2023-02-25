# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  users.filter{ |user| user[:gender] == 'male' }.reduce({}) do |acc, user|
    year, = user[:birthday].split('-')
    acc[year] ||= 0
    acc[year] += 1
    acc
  end
end
# END
