# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

# class for url query params
class Url
  attr_accessor :url

  extend Forwardable
  def_delegators :@url, :scheme, :host, :port

  def initialize(params)
    @url = URI params
  end

  def addr(url)
    url.to_s.split('?').first
  end

  def query_params
    hash = {}
    if @url.to_s.include?('?')
      @url.to_s.split('?').last.split('&').each do |param|
        key, value = param.split('=')
        hash[key.to_sym] = value
      end
    end
    hash
  end

  def query_param(key, value = nil)
    query_params.keys.include?(key.to_sym) ? query_params[key.to_sym] : value
  end

  def ==(other)
    addr(@url.to_s) == addr(other.url.to_s) && query_params == other.query_params
  end
end
# END
