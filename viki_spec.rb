require 'viki'

describe "testing suite" do

	it "should return poland nonation" do
		poland_notation("27+35").should == ["27", "35", "+"]
	end

	it "should return poland nonation" do
		poland_notation("27+35+45").should == ["27", "35", "45", "+", "+"]
	end

	it "should return poland nonation" do
		poland_notation("2+3*5").should == ["2", "3", "5", "*", "+"]
	end

	it "should return poland nonation" do
		poland_notation("(2+3)*5").should == ["2", "3", "+", "5", "*"]
	end

	it "should return poland nonation" do
		poland_notation("(2+3)*(5+7)").should == ["2", "3", "+", "5", "7", "+", "*"]
	end

	it "should return poland nonation" do
		poland_notation("5*(1+2)").should == ["5", "1", "2", "+", "*"]
	end

	it "should return poland nonation" do
		poland_notation("25^5+4*3").should == ["25", "5", "^", "4", "3", "*", "+"]
	end

	it "should ddd" do
		poland_notation("(12+1)^(90*8+7)-12").should == ["12", "1", "+", "90", "8", "*", "7", "+", "^", "12", "-"]
	end

	it "should return value of node" do
		node = Node.new("+", 2, 1)
		node.value.should == 3
	end
end
