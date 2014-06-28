require 'spec_helper'

describe Post do
  it "is valid with a title, description, and price" do
    post = Post.create(
      title: "Alphabet",
      description: "Soup",
      price: 100)
    expect(post).to be_valid
  end
  it "is invalid without a title" do
    expect(Post.new(title: nil)).to have(1).errors_on(:title)
  end
  it "is invalid without a description" do
    expect(Post.new(description: nil)).to have(1).errors_on(:description)
  end
  it "is invalid without a price" do
    expect(Post.new(price: nil)).to have(1).errors_on(:price)
  end
end
