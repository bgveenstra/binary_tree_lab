require "./lib/binary_tree.rb"

describe "BinaryTree" do

  describe "#attr_accessors" do

    it "should have :value and :value=" do
      tree = BinaryTree.new
      expect(tree).to respond_to(:value)
      expect(tree).to respond_to(:value=)
    end


    it "should have :left and :left=" do
      tree = BinaryTree.new
      expect(tree).to respond_to(:left)
      expect(tree).to respond_to(:left=)
    end

    it "should have :right and :right=" do
      tree = BinaryTree.new
      expect(tree).to respond_to(:right)
      expect(tree).to respond_to(:right=)
    end

  end

  describe "#new" do 

    it "should accept a value" do
      tree = BinaryTree.new(5)
      expect(tree.value).to eql(5)
    end

  end

  describe "#insert" do

    before(:each) do 
      @tree = BinaryTree.new 
    end

    it "should update the :value if nil" do
      @tree.insert(5)
      expect(@tree.value).to eql(5)
    end

    it "should insert to the left for less than values" do
      @tree.insert(5)
      @tree.insert(4)
      left = @tree.left
      expect(left.value).to eql(4)
    end

    it "should insert to the right for greater than values" do
      @tree.insert(5)
      @tree.insert(6)
      right = @tree.right
      expect(right.value).to eql(6)
    end

    it "should return instance after insert" do
      return_val = @tree.insert(4)
      expect(return_val).to eql(@tree)
    end

  end

  describe "#height" do

    before(:each) do
      @tree = BinaryTree.new(50)
      @tree.insert(25)
      @tree.insert(75)
      @tree.insert(13)
      @tree.insert(37)
      @tree.insert(63)
      @tree.insert(87)
    end

    it "should take the max height" do
      expect(@tree.height).to eql(2)
    end

  end

  describe "#include?" do

    before(:each) do
      @tree = BinaryTree.new(50)
      @tree.insert(25)
      @tree.insert(75)
      @tree.insert(13)
      @tree.insert(37)
      @tree.insert(63)
      @tree.insert(87)
    end

    it "should take the max height" do
      aggregate_failures("inclusions") do
        expect(@tree.include?(63)).to be(true)
        expect(@tree.include?(37)).to be(true)
        expect(@tree.include?(10)).to be(false)
      end
    end
  end

  describe "#leaf?" do

    before(:each) do
      @tree = BinaryTree.new(5)
    end

    it "should return true tree with no left and right trees" do
      expect(@tree.leaf?).to be(true)
    end

    it "should return false for tree with subtree" do
      @tree.insert(4)
      expect(@tree.leaf?).to be(false)
    end

  end

  describe "#to_arr" do

    before(:each) do
      @tree = BinaryTree.new(50)
      @tree.insert(25)
      @tree.insert(75)
      @tree.insert(13)
      @tree.insert(37)
      @tree.insert(63)
      @tree.insert(87)
    end

    it "should return a sorted arr" do
      result = @tree.to_arr
      expect(result).to eql([13, 25, 37, 50, 63, 75, 87])
    end

  end

end
