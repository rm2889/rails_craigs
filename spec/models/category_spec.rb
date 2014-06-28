require 'spec_helper'

describe Category do
  it "is valid with a name" do
    category = Category.new(
      name: "Deep House")
    expect(category).to be_valid
  end
  it "is invalid without a name" do
    expect(Category.new(name: nil)).to have(1).errors_on(:name)
  end
  it "is invalid with duplicate names" do
    cat = Category.create(name: "Jon Snow")
    expect(Category.new(name: "Jon Snow")).to have(1).errors_on(:name)
  end
end
