require 'viki'

describe "testing suite" do

	it "should return poland nonation" do
		poland_notation("27+35").should == "2735+"
	end

	it "should return poland nonation" do
		poland_notation("27+35+45").should == "273545++"
	end

	it "should return poland nonation" do
		poland_notation("2+3*5").should == "235*+"
	end

end
