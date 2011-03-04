require 'viki'

describe "testing suite" do

	it "should return poland nonation" do
		poland_notation("27+35").should == ["27", "35", "+"]
	end

	it "should return poland nonation" do
		poland_notation("27+35+45").should == "273545++"
	end

	it "should return poland nonation" do
		poland_notation("2+3*5").should == "235*+"
	end

	it "should return poland nonation" do
		poland_notation("(2+3)*5").should == "23+5*"
	end

	it "should return poland nonation" do
		poland_notation("(2+3)*(5+7)").should == "23+57+*"
	end

	it "should return poland nonation" do
		poland_notation("5*(1+2)").should == "512+*"
	end

	it "should return poland nonation" do
		poland_notation("25^5+4*3").should == "255^43*+"
	end

	it "should ddd" do
		poland_notation("(12+1)^(90*8+7)-12").should == "121+908*7+^12-"
	end

	it "should return value of node" do
		node = Node.new("+", 2, 1)
		node.value.should == 3
	end
end
