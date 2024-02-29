# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'
require 'minitest/autorun'


class StackTest < Minitest::Test
  # BEGIN
  def setup; end

  def teardown; end

  def test_add_element
    stack1 = Stack.new
    stack1.push!('i')
    assert(stack1.size == 1)
  end

  def test_delete_element
    stack1 = Stack.new
    stack1.push!('i')
    stack1.pop!
    assert(stack1.size.zero?)
  end

  def test_clear_stack
    stack1 = Stack.new
    stack1.push!('i')
    stack1.push!('x')
    stack1.push!('z')
    stack1.clear!
    assert(stack1.empty?)
  end

  def test_empty_stack
    stack1 = Stack.new
    assert(stack1.empty?)
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
