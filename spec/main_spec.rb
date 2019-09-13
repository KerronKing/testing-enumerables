# frozen_string_literal: true

require './lib/main'

RSpec.describe Enumerable do
  describe '#my_count' do
    it 'calls a block on an object and returns the number of elements' do
      arr = [1, 2, 3, 4, 5]
      expect(arr.my_count).to eql(5)
    end
  end

  describe '#my_map' do
    it 'returns a new array as a result of calling a block once on each item in the original array' do
      arr = [1, 2, 3]
      result = [2, 4, 6]
      expect(arr.my_map { |x| x * 2 }).to(eql(result))
    end
  end

  describe '#my_any?' do
    it 'returns true if the block passed returns true for any item in the array' do
      arr = [1, 2, 3]
      expect(arr.my_any? { |x| x > 2 }).to(eql(true))
    end
  end

  describe '#my_none?' do
    it 'returns true if the block passed returns false for each item in the array' do
      arr = [1, 2, 3]
      expect(arr.my_none? { |x| x > 4 }).to(eql(true))
    end
  end

  describe '#my_select' do
    it 'returns an array containing the items that return through when a block is passed to them' do
      arr = [1, 2, 3, 4]
      result = [2, 4]
      expect(arr.my_select(&:even?)).to(eql(result))
    end
  end

  describe '#my_inject' do
    it 'combines all elements by applying a binary function specified in a block' do
      arr = [1, 2, 3]
      expect(arr.my_inject { |x, y| x + y }).to(eql(6))
    end
  end
end
