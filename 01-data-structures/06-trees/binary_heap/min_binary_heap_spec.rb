include RSpec

require_relative "min_binary_heap"

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { MinBinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  # A binary heap is a complete binary tree; that is, all levels of the tree, except possibly the last one (deepest) are fully filled, and, if the last level of the tree is not complete, the nodes of that level are filled from left to right

  describe "#insert(data)" do
    it "inserts nodes with lesser values before nodes with greater values" do
      tree.insert(root, pacific_rim)
      expect(tree.root.title).to eq "Pacific Rim"
    end

    it "inserts a new node with lesser value and it swaps with the parent with higher value" do
      tree.insert(root, pacific_rim)
      expect(tree.root.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      expect(tree.root.left.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      expect(tree.root.right.title).to eq "Inception"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, district)
      expect(tree.root.right.title).to eq "District 9"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, district)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, mad_max_2)
      expect(tree.root.right.left.title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, district)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, mad_max_2)
      tree.insert(tree.root, empire)
      expect(tree.root.right.right.title).to eq "Star Wars: The Empire Strikes Back"
    end
  end

  describe "#print" do
    it "should print" do
      tree.insert(root, hope)
      tree.insert(root, empire)
      tree.insert(root, jedi)
      tree.insert(root, martian)
      tree.insert(root, pacific_rim)
      tree.insert(root, inception)
      tree.insert(root, braveheart)
      tree.insert(root, shawshank)
      tree.insert(root, district)
      tree.insert(root, mad_max_2)
      tree.print()
    end
    specify {
      expected_output = "The Matrix: 87\nStar Wars: Return of the Jedi: 80\nStar Wars: A New Hope: 93\nPacific Rim: 72\nInception: 86\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nBraveheart: 78\nThe Shawshank Redemption: 91\nMad Max 2: The Road Warrior: 98\nDistrict 9: 90\n"
      tree.insert(root, hope)
      tree.insert(root, empire)
      tree.insert(root, jedi)
      tree.insert(root, martian)
      tree.insert(root, pacific_rim)
      tree.insert(root, inception)
      tree.insert(root, braveheart)
      tree.insert(root, shawshank)
      tree.insert(root, district)
      tree.insert(root, mad_max_2)
      tree.print
      expect { tree.print}.to output(expected_output).to_stdout
    }

    specify {
      expected_output = "The Matrix: 87\nBraveheart: 78\nMad Max 2: The Road Warrior: 98\nPacific Rim: 72\nInception: 86\nDistrict 9: 90\nStar Wars: Return of the Jedi: 80\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
      tree.insert(root, mad_max_2)
      tree.insert(root, district)
      tree.insert(root, shawshank)
      tree.insert(root, braveheart)
      tree.insert(root, inception)
      tree.insert(root, pacific_rim)
      tree.insert(root, martian)
      tree.insert(root, jedi)
      tree.insert(root, empire)
      tree.insert(root, hope)
      tree.print
      expect { tree.print }.to output(expected_output).to_stdout
    }
  end
end
