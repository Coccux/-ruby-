class Tree_node
	attr_accessor :element, :left, :right

	def initialize(element)
		@element = element
		@left = nil
		@right = nil
	end
end