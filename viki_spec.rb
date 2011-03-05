require 'viki'

describe "testing suite" do

	it "should return poland nonation" do
		Builder.new("27+35").build.value.should == 62
	end

	it "should return poland nonation" do
		Builder.new("27+35+45").build.value.should == 107
	end

	it "should return poland nonation" do
		Builder.new("2+3*5").build.value.should == 17
	end

	it "should return poland nonation" do
		Builder.new("(2+3)*5").build.value.should == 25
	end

	it "should return poland nonation" do
		Builder.new("(2+3)*(5+7)").build.value.should == 60
	end

	it "should return poland nonation" do
		Builder.new("5*(1+2)").build.value.should == 15
	end

	it "should return poland nonation" do
		Builder.new("25^(1/2)+4*3").build.value.should == 17
	end
end
