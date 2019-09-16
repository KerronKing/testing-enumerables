# frozen_string_literal: true

require './lib/main'

RSpec.describe Enumerable do
  let(:arr) { [1, 2, 3] }

  describe '#my_count' do
    it 'returns the size of the object if no argument or block is given' do
      expect(arr.my_count).to eql(3)
    end

    it 'returns the number of items in the object that are equal to the argument given' do
      expect(arr.my_count(2)).to eql(1)
    end

    it 'calls a block on an object and returns the number of elements that evaluate to true' do
      expect(arr.my_count {|x| x < 4}).to eql(3)
    end
  end

  describe '#my_map' do
    it 'returns the result of calling a block on each array item (multiplication case)' do
      result = [2, 4, 6]
      expect(arr.my_map { |x| x * 2 }).to eql(result)
    end

    it 'returns a new array as a result of calling a block once on each item in the original array (addition case)' do
      result = [3, 4, 5]
      expect(arr.my_map { |x| x + 2 }).to eql(result)
    end

    it 'returns the result of calling a block on each array item (subtraction case)' do
      result = [-1, 0, 1]
      expect(arr.my_map { |x| x - 2 }).to eql(result)
    end
  end

  describe '#my_any?' do
    it 'returns true if the block passed returns true for any item in the array' do
      expect(arr.my_any? { |x| x > 2 }).to eql(true)
    end
    it 'returns false if the block passed returns false for all item in the array' do
      expect(arr.my_any? { |x| x > 3 }).to eql(false)
    end
  end

  describe '#my_none?' do
    it 'returns true if the block passed returns false for each item in the array' do
      expect(arr.my_none? { |x| x > 4 }).to eql(true)
    end
    it 'returns false if the block passed returns true for any item in the array' do
      expect(arr.my_none? { |x| x > 2 }).to eql(false)
    end
    it 'returns false if the block passed returns true for all items in the array' do
      expect(arr.my_none? { |x| x < 4 }).to eql(false)
    end
  end

  describe '#my_select' do
    it 'returns an array containing the items that return true when a block is passed to them' do
      result = [2]
      expect(arr.my_select(&:even?)).to eql(result)
    end
  end

  describe '#my_inject' do
    it 'combines all elements by applying a binary function specified in a block (addition case)' do
      expect(arr.my_inject { |x, y| x + y }).to eql(6)
    end
    it 'combines all elements by applying a binary function specified in a block (multiplication case)' do
      expect(arr.my_inject { |x, y| x * y }).to eql(6)
    end
  end
end
