require 'rails_helper'

RSpec.describe Item, type: :model do


  describe "validations" do



    describe "name" do

     it "is valid with valid params" do
       item = build(:item)
       expect(item).to be_valid

     end


      it "is invalid without a name" do
        item = build(:item, name: nil)
        expect(item).not_to be_valid
        expect(item.errors[:name]).to include("can't be blank")
      end


      it "requires a unique name" do
       item1 = create(:item, name: "blue")
       duplicate = build(:item, name: "blue")
       expect(duplicate).not_to be_valid
      end


      it "requires name length to be at least 3 characters" do
               item = build(:item, name: "ab")

        expect(item).not_to be_valid
      end


      it "requires name length to be maximum 50 characters" do
        item = build(:item, name: "a" * 51)
        expect(item).not_to be_valid
      end
    end


    describe "description" do
      it "is invalid without a description" do
         item = build(:item, description: nil)
        expect(item).not_to be_valid
      end


      it "requires description length to be at least 3 characters" do

           item = build(:item, description: "ab")
        expect(item).not_to be_valid
      end


      it "requires description length to be maximum 400 characters" do
        item = build(:item, description: "a" * 1001)
        expect(item).not_to be_valid
      end
    end


    describe "price" do
      it "is invalid without a price" do
        item = build(:item, price: nil)
        expect(item).not_to be_valid
      end

      it "requires price greater than 0.05" do
        item = build(:item, price: 0.05)
        expect(item).not_to be_valid
      end

      it "requires price greater than 0.05" do
        item = build(:item, price: 0.06)
        expect(item).to be_valid
      end
    end


    describe "picture" do
      it "requires a picture when creating an item" do
        item1 = Item.new(
          name: "Picture Test",
          description: "Description",
          price: 10,
        )
        expect(item1).not_to be_valid
        puts item1.errors
        expect(item1.errors[:picture]).to include("must be attached")
      end


      it "is valid when a picture is attached on creation" do
        item = build(:item)
        expect(item).to be_valid
      end


      it "does not require a new picture when updating" do
        item2 = create(:item)
        item2.name = "Updated name"
        expect(item2).to be_valid
      end
    end

  end
end
