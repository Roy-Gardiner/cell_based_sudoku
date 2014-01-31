require "./sudoku"

#describe "Sudoku validation" do
#
#  it "should check the grid length" do
#  	sudoku = Sudoku.new
#
#		expect(sudoku.grid("1223")).to eq("Grid definition must be exactly 81 characters")
#
#	end
#end
#
#describe "Sudoku grid setup and play" do
#	let(:string) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
#
#	it "should solve it" do
#
#		sudoku = Sudoku.new 
#		sudoku.grid(string)
#		expect(sudoku.play).to eq("615493872348127956279568431496832517521746389783915264952681743864379125137254698")
#	end
#end
#
#describe "Sudoku hard game setup and play" do
#	              let(:string) {'1....7.9..3..2...8..96..5....53..9...1..8...26....4...3......1..4......7..7...3..'}
#
#	it "maybe solve it" do
#
#		sudoku = Sudoku.new 
#		sudoku.grid(string)      #'1....7.9..3..2...8..96..5....53..9...1..8...26....4...3......1..4......7..7...3..'
#		expect(sudoku.play).to eq('162857493534129678789643521475312986913586742628794135356478219241935867897261354')
#	end
#end

describe "One with 5 solutions, apparently" do
	              let(:string) {'8..6..9.5.............2.31...7318.6.24.....73...........279.1..5...8..36..3......'}

	it "maybe solve it" do

		sudoku = Sudoku.new 
		sudoku.grid(string)      #'8..6..9.5.............2.31...7318.6.24.....73...........279.1..5...8..36..3......'
		expect(sudoku.play_hard).to eq('814637925325149687796825314957318462241956873638274591462793158579481236183562749')
	end
end

