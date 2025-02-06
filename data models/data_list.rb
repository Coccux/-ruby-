require_relative 'deep_copy.rb'
require_relative 'data_table.rb'
class DataList
	def initialize(items)
		raise ArgumentError, 'Items must be an array' unless items.is_a?(Array)
		@items = items
		@selected = []
	end
	def select(number)
		raise ArgumentError, 'Invalid index' unless  number >= 0 && number < @items.size
		@selected << number unless @selected.include?(number)
	end
	def get_selected
		DeepCopy.copy(selected)
	end
  
	def proceed_data_table
		dt=[]
		dt << self.get_names
		dt.concat(self.get_data)
		DataTable.new(dt)
	end
	def get_names
		column_names = ['№'] 
        base_names.each do |name| 
            column_names << name
        end
        column_names
	end
	def get_data
		data_table = [get_names]  
        data.each_with_index do |item, index|
            data_table << build_row(item, index)
        end
        Data_table.new(data_table)
	end
	
	def base_names
        raise NotImplementedError, 'Метод не реализован в данном классе'
    end    
	
    
    def build_row(item, index)
        raise NotImplementedError, 'Метод не реализован в данном классе'
    end
	
	protected
	attr_accessor :selected
end