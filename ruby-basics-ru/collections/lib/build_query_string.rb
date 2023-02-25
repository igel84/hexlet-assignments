# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def build_query_string(params = {})
  result = []
  params.keys.sort.each do |param|
    result << "#{param}=#{params[param]}"
  end
  result.join('&')
end
# END
# rubocop:enable Style/For
