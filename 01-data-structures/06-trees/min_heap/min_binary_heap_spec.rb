include RSpec

require "pry"
require_relative "min_binary_heap"

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { HeapNode.new("The Matrix", 87) }

  let (:tree) { MinBinaryHeap.new(root) }
  let (:pacific_rim) { HeapNode.new("Pacific Rim", 72) }
  let (:braveheart) { HeapNode.new("Braveheart", 78) }
  let (:jedi) { HeapNode.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { HeapNode.new("Donnie Darko", 85) }
  let (:inception) { HeapNode.new("Inception", 86) }
  let (:district) { HeapNode.new("District 9", 90) }
  let (:shawshank) { HeapNode.new("The Shawshank Redemption", 91) }
  let (:martian) { HeapNode.new("The Martian", 92) }
  let (:hope) { HeapNode.new("Star Wars: A New Hope", 93) }
  let (:empire) { HeapNode.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { HeapNode.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "inserts nodes with lesser values before nodes with greater values" do

      tree.insert(tree.root, pacific_rim)
      expect(tree.root.title).to eq "Pacific Rim"
      expect(tree.root.left.title).to eq "The Matrix"
    end

    it "properly inserts a new HeapNode as a left-left child" do
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, jedi)
      expect(tree.root.left.left.title).to eq "The Matrix"
    end

    it "properly inserts a new HeapNode as a left-right child" do
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      expect(tree.root.right.title).to eq "Inception"
    end

    it "properly inserts a new HeapNode as a right child" do
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, district)
      expect(tree.root.right.title).to eq "District 9"
    end

    it "properly inserts a new HeapNode as a right-left child" do
      tree.insert(tree.root, pacific_rim) # 72
      tree.insert(tree.root, district) #90
      tree.insert(tree.root, hope) # 93
      tree.insert(tree.root, mad_max_2) # 98
      tree.insert(tree.root, martian) # 92
      expect(tree.root.left.right.title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly inserts a new HeapNode as a right-right child" do
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, district)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, mad_max_2)
      tree.insert(tree.root, empire)
      expect(tree.root.right.right.title).to eq "Star Wars: The Empire Strikes Back"
    end
  end
  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(root, nil)).to eq nil
    end

    it "properly deletes a left HeapNode" do
      tree.insert(root, hope)
      tree.delete(root, hope.title)
      expect(tree.find(root, hope.title)).to be_nil
    end

    it "properly deletes a left-left HeapNode" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.delete(root, pacific_rim.title)
      expect(tree.find(root, pacific_rim.title)).to be_nil
    end

    it "properly deletes a left-right HeapNode" do
      tree.insert(root, donnie)
      tree.insert(root, inception)
      tree.delete(root, inception.title)
      expect(tree.find(root, inception.title)).to be_nil
    end

    it "properly deletes a right HeapNode" do
      tree.insert(root, district)
      tree.delete(root, district.title)
      expect(tree.find(root, district.title)).to be_nil
    end

    it "properly deletes a right-left HeapNode" do
      tree.insert(root, hope)
      tree.insert(root, martian)
      tree.delete(root, martian.title)
      expect(tree.find(root, martian.title)).to be_nil
    end

    it "properly deletes a right-right HeapNode" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      tree.delete(root, mad_max_2.title)
      expect(tree.find(root, mad_max_2.title)).to be_nil
    end
  end
  describe "#print" do
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
       binding.pry
       expect { tree.printf }.to output(expected_output).to_stdout
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

       expect { tree.print }.to output(expected_output).to_stdout
     }
  end
end
