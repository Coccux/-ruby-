def read_data_from_file(filename)
	File.readlines(filename).map(&:strip).reject(&:empty?)
end

def find_unique_element(arr, &block)
	block.call(arr)
end

def find_two_smallest(arr, &block)
	block.call(arr)
end