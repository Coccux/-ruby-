class Data_list

    def initialize(data, offset = 0)
        self.data = data
        self.selected = []
		self.offset = offset
    end

    
    def select(number)
        unless number.is_a?(Integer) && number >= 0 && number < data.size
            raise ArgumentError, 'Параметр должен быть числом в пределах размера массива'
        end
        self.selected << number unless self.selected.include?(number)
    end

    def get_selected
        self.selected
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

    def data=(data)
        
        unless data.is_a?(Array)
            raise ArgumentError, 'Переданный параметр должен быть массивом'
        end

        @data = data
    end
	
	def offset=(offset)
        unless offset.is_a?(Integer) && offset >= 0
            raise ArgumentError, 'Offset должен быть неотрицательным числом'
        end
        @offset = offset
    end

    private
    
    attr_reader :data, :offset
    attr_accessor :selected

    def base_names
        raise NotImplementedError, 'Метод не реализован в данном классе'
    end    

    def build_row(item, index)
        raise NotImplementedError, 'Метод не реализован в данном классе'
    end    
end