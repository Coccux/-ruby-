class ArrayProcessor
  attr_reader :array

  def initialize(array: [])
    @array = array.freeze
  end

  def all?
    return true unless block_given?
    
    self.array.each do |element|
      return false unless yield(element)
    end
    true
  end

  def flat_map
    return self.array unless block_given?
    
    result = []
    self.array.each do |element|
      mapped_value = yield(element)
      result.concat(mapped_value.is_a?(Array) ? mapped_value : [mapped_value])
    end
    result
  end

  def one?
    return false unless block_given?
    count = 0
    
    self.array.each do |element|
      count += 1 if yield(element)
      return false if count > 1
    end
    count == 1
  end

  def inject(initial = nil)
    accumulator = initial.nil? ? self.array.first : initial
    start_index = initial.nil? ? 1 : 0
    
    self.array[start_index..].each do |element|
      accumulator = yield(accumulator, element)
    end
    accumulator
  end

  def min_by
    return self.array.min unless block_given?
    
    min_element = self.array.first
    min_value = yield(min_element)
    
    self.array.each do |element|
      current_value = yield(element)
      if current_value < min_value
        min_element = element
        min_value = current_value
      end
    end
    min_element
  end

  def find
    return nil unless block_given?
    
    self.array.each do |element|
      return element if yield(element)
    end
    nil
  end
end

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
