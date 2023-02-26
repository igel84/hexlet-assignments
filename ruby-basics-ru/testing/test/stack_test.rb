# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
    @stack.push! 'ruby'
  end
  # добавления элемента
  def test_adding_element
    assert { @stack.to_a == ["ruby"] }
  end

  # удаления элемента
  def test_removing_element
    @stack.pop!
    assert { @stack.to_a == [] }
  end
  
  # очистки стека
  def test_clearing_element
    @stack.clear!
    assert { @stack.to_a == [] }
  end

  # проверки стека на пустоту
  def test_check_to_empty
    @stack.clear!
    assert { @stack.empty? == true }
  end

  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
