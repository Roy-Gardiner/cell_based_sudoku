require './cell'

class Sudoku

	CELL_POSSIBLE_VALUES = ["1","2","3","4","5","6","7","8","9"]

  def play_hard

  	
    puts ">#{@input}<" 
    
    solution = ""
    (0..1).each do
    	solution = play
#@cells.each do |cell|
#
#puts " #{cell.value} #{cell.possible_values}" 
#
#end
     	if solution.include?('.') || solution.include?('0')
       	
       	puts ">#{solution}< wrong"  
     		
     		guess_a_cell_value
  
     	else 
     		break
     		puts ">#{solution}< bingo!"  
     	end 
     	
    end	
    solution
  end

  def guess_a_cell_value

  	cell = get_cell_with_fewest_possible_values

  	set_guessed_value(cell)
  end

  def get_cell_with_fewest_possible_values

  	this_cell = ""
  	shortest_length = 10
  	
  	@cells.each_with_index do |cell,i|
  		if cell.possible_values.length < shortest_length && 
  			!CELL_POSSIBLE_VALUES.include?(cell.value)
  			
  			this_cell = cell 
#  			puts "  found #{i} #{this_cell.value} #{cell.possible_values.length}"

  	    shortest_length = cell.possible_values.length
  		end
  	end	
  	this_cell
  end	

  def set_guessed_value cell 

  	cell.guessed = true
  	cell.value = cell.possible_values[0]
# aaaaaaaargh
  end


	def play
  	new_values_found = true
  	
  	while new_values_found 
  		new_values_found = false
  	  @cells.each_with_index do |this_cell,i|
  	  	
  	  	cell_possible_values = set_cell_possible_values(this_cell)
  	  		
  	  	new_values_found = set_new_cell_value?(this_cell)
  	  end
  	end

  	@cells.map do |this_cell|
  		this_cell.value
  	end.join
  end

  def grid string

		return "Grid definition must be exactly 81 characters" if string.length != 81	

		@input = string

		@cells = []
		(0..string.length-1).each do |i|  
  		@cells << Cell.new(number: i, value: string[i])
  	end

  	set_neighbours_of_each_cell
  end


  def set_cell_possible_values this_cell
  	cell_possible_values = CELL_POSSIBLE_VALUES.dup
  	
  	if cell_possible_values.include?(this_cell.value)	
  		cell_possible_values = []
  	else 
  		this_cell.neighbours.each do |neighbour|
  			cell_possible_values.delete(neighbour.value)
  		end	
  	end	
  	this_cell.possible_values= cell_possible_values
    cell_possible_values
  end

  def set_new_cell_value? this_cell

  	if this_cell.possible_values.length == 1
  	 	this_cell.value= this_cell.possible_values[0]
  	 	this_cell.possible_values.delete(this_cell.value)
  	 	return true
  	else return false
  	end
  end	

  

  def boxes
  	[
			        [ @cells[0], @cells[1],   @cells[2],  @cells[9],  @cells[10],  @cells[11],  @cells[18],  @cells[19],  @cells[20]],
			        [ @cells[3], @cells[5],   @cells[5], @cells[12],  @cells[13],  @cells[14],  @cells[21],  @cells[22],  @cells[23]],
			        [ @cells[6], @cells[7],   @cells[8], @cells[15],  @cells[16],  @cells[17],  @cells[24],  @cells[25],  @cells[26]],
			        [@cells[27], @cells[28], @cells[29], @cells[36],  @cells[37],  @cells[38],  @cells[45],  @cells[46],  @cells[47]],
			        [@cells[30], @cells[31], @cells[32], @cells[39],  @cells[40],  @cells[41],  @cells[48],  @cells[49],  @cells[50]],
			      	[@cells[33], @cells[34], @cells[35], @cells[42],  @cells[43],  @cells[44],  @cells[51],  @cells[52],  @cells[53]],
			      	[@cells[54], @cells[55], @cells[56], @cells[63],  @cells[64],  @cells[65],  @cells[72],  @cells[73],  @cells[74]],
			      	[@cells[57], @cells[58], @cells[59], @cells[66],  @cells[67],  @cells[68],  @cells[75],  @cells[76],  @cells[77]],
			      	[@cells[60], @cells[61], @cells[62], @cells[69],  @cells[70],  @cells[71],  @cells[78],  @cells[79],  @cells[80]],
	  ]
	end
	def rows
		[
			        [ @cells[0],  @cells[1],  @cells[2],  @cells[3],   @cells[4],   @cells[5],   @cells[6],   @cells[7],   @cells[8]],
			        [ @cells[9], @cells[10], @cells[11], @cells[12],  @cells[13],  @cells[14],  @cells[15],  @cells[16],  @cells[17]],
			        [@cells[18], @cells[19], @cells[20], @cells[21],  @cells[22],  @cells[23],  @cells[24],  @cells[25],  @cells[26]],
			        [@cells[27], @cells[28], @cells[29], @cells[30],  @cells[31],  @cells[32],  @cells[33],  @cells[34],  @cells[35]],
			        [@cells[36], @cells[37], @cells[38], @cells[39],  @cells[40],  @cells[41],  @cells[42],  @cells[43],  @cells[44]],
			      	[@cells[45], @cells[46], @cells[47], @cells[48],  @cells[49],  @cells[50],  @cells[51],  @cells[52],  @cells[53]],
			      	[@cells[54], @cells[55], @cells[56], @cells[57],  @cells[58],  @cells[59],  @cells[60],  @cells[61],  @cells[62]],
			      	[@cells[63], @cells[64], @cells[65], @cells[66],  @cells[67],  @cells[68],  @cells[69],  @cells[70],  @cells[71]],
			      	[@cells[72], @cells[73], @cells[74], @cells[75],  @cells[76],  @cells[77],  @cells[78],  @cells[79],  @cells[80]],
	  ]
		end
		def cols
		[
			        [@cells[0],  @cells[9], @cells[18], @cells[27],  @cells[36],  @cells[45],  @cells[54],  @cells[63],  @cells[72]],
			        [@cells[1], @cells[10], @cells[19], @cells[28],  @cells[37],  @cells[46],  @cells[55],  @cells[64],  @cells[73]],
			        [@cells[2], @cells[11], @cells[20], @cells[29],  @cells[38],  @cells[47],  @cells[56],  @cells[65],  @cells[74]],
			        [@cells[3], @cells[12], @cells[21], @cells[30],  @cells[39],  @cells[48],  @cells[57],  @cells[66],  @cells[75]],
			        [@cells[4], @cells[13], @cells[22], @cells[31],  @cells[40],  @cells[49],  @cells[58],  @cells[67],  @cells[76]],
			      	[@cells[5], @cells[14], @cells[23], @cells[32],  @cells[41],  @cells[50],  @cells[59],  @cells[68],  @cells[77]],
			      	[@cells[6], @cells[15], @cells[24], @cells[33],  @cells[42],  @cells[51],  @cells[60],  @cells[69],  @cells[78]],
			      	[@cells[7], @cells[16], @cells[25], @cells[34],  @cells[43],  @cells[52],  @cells[61],  @cells[70],  @cells[79]],
			      	[@cells[8], @cells[17], @cells[26], @cells[35],  @cells[44],  @cells[53],  @cells[62],  @cells[71],  @cells[80]],
	  ]  

		end

	def neighbours_box cell
		boxes.each do |box|
    	if box.include?(cell) 
    		cell.identify_neighbours(box)
    		break
    	end
    end
	end

	def neighbours_row cell
		rows.each do |row|
    	if row.include?(cell) 
    		cell.identify_neighbours(row)
    		break
    	end
    end
	end

	def neighbours_col cell
		cols.each do |col|
    	if col.include?(cell) 
    		cell.identify_neighbours(col)
    		break
    	end
    end
	end

  def set_neighbours_of_each_cell
#
#  This is the grid layout, note starting at zero.
#
# 		0  1  2    3  4  5    6  7  8
# 		9 10 11   12 13 14   15 16 17
#    18 19 20   21 22 23   24 25 26
#      
#    27 28 29   30 31 32   33 34 35 
#    36 37 38   39 40 41   42 43 44 
#    45 46 47   48 49 50   51 52 53
#
#    54 55 56   57 58 59   60 61 62  
#    63 64 65   66 67 68   69 70 71
#    72 73 74   75 76 77   78 79 80
#

    @cells.each do |cell| 

    	neighbours_box(cell)

    	neighbours_row(cell)
    	
    	neighbours_col(cell)
    end
  end
end