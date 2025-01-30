require 'minitest/autorun'
require_relative 'ArrayProcessor.rb'
class ArrayProcessorAutoTest
  def self.run_tests
    obj = ArrayProcessorAutoTest.new
    results = []
    obj.public_methods(false).each do |method_name|
      puts "Вызов #{method_name}"
      puts obj.send(method_name)
      results << obj.send(method_name)
    end
    if results.all?
      puts "passed all tests"
    else
      puts "didn't pass"
    end
  end

  def initialize
    @array_processor = ArrayProcessor.new(array: [1, 2, 3, 4, 5])
  end

  def test_elements
    [1, 2, 3, 4, 5] == @array_processor.array
  end

  def test_all?
    @array_processor.all? { |x| x > 0 }
  end

  def test_flat_map
    @array_processor.flat_map { |x| [x, x * 2] } == [1, 2, 2, 4, 3, 6, 4, 8, 5, 10]
  end

  def test_one?
    @array_processor.one? { |x| x == 3 }
  end

  def test_inject
    sum = @array_processor.inject(0) { |acc, x| acc + x }
    15 == sum
  end

  def test_min_by
    @array_processor.min_by { |x| -x } == 5
  end

  def test_find
    @array_processor.find { |x| x > 3 } == 4
  end
end

ArrayProcessorAutoTest.run_tests
