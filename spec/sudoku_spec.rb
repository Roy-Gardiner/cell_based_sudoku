require "./sudoku"

describe "Sudoku validation" do

  it "should check the grid length" do
  	sudoku = Sudoku.new

		expect(sudoku.grid("1223")).to eq("Grid definition must be exactly 81 characters")

	end
end

describe "Sudoku grid setup" do
	let(:string) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}

	it "should solve the fucker" do

		sudoku = Sudoku.new 
		sudoku.grid(string)
		expect(sudoku.play).to eq("615493872348127956279568431496832517521746389783915264952681743864379125137254698")
	end
  


end