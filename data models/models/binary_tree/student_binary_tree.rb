require_relative "./student_binary_tree_node.rb"
require_relative "../student/student.rb"

class Student_binary_tree
	include Enumerable

	attr_reader :root

	def initialize
		@root = nil
	end

	
	def insert(element)
		if @root.nil?
			@root = Tree_node.new(element)
		else
			insert_node(@root, element)
		end
	end

	def each(&block)
		dfs(@root, &block)
	end

	private

	def dfs(node, &block)
		return if node.nil?

		dfs(node.left, &block)
		yield node
		dfs(node.right, &block)
	end

	def insert_node(node, element)
		if element < node.element
			if node.left.nil?
				node.left = Tree_node.new(element)
			else
				insert_node(node.left, element)
			end
		else
			if node.right.nil?
				node.right = Tree_node.new(element)
			else
				insert_node(node.right, element)
			end
		end
	end
end