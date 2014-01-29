class Cell

  def initialize(options={})
    @number = options.fetch(:number,number)
    @value = options.fetch(:value,value)
    @neighbours = []
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