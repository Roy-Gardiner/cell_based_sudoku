class Cell

  def initialize(options={})
    @number = options.fetch(:number,number)
    @value = options.fetch(:value,value)
    @possible_values = []
    @neighbours = []
    @guessed = false
    @guessed_values = []
  end

  def number
    @number
  end
  
  def value
    @value
  end
  def value= sudoku_number
    @value = sudoku_number
  end
  def possible_values= values 
    @possible_values = values
  end 
  def possible_values
    @possible_values 
  end 
  def guessed= value 
    @guessed = value
  end

  
  def identify_neighbours cell_collection
    
    cell_collection.each do |cell|
      
      @neighbours.delete(cell)
      @neighbours << cell
    end
  end
  
  def neighbours 
    @neighbours 
  end


end