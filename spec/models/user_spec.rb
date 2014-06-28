require 'spec_helper'

describe User do
  it "is valid with a username, email, and password" do
    user = User.new(
      username: "bluenikes",
      email: "drknockers@pinkpanther.com",
      password: "holla@chaboy")
    expect(user).to be_valid
  end
  it "is invalid without a username" do
    expect(User.new(username: nil, email: "holla@back.com", password: "hai")).to have(1).errors_on(:username)
  end
  it "is invalid with a duplicate username" do
    user = User.create(username: "nomiS", email: "holla@back.com", password: "hai")
    expect(User.new(username: "nomiS", email: "holla@forward.com", password: "dou")).to have(1).errors_on(:username)
  end
  it "is invalid without an email" do
    expect(User.create(email: nil)).to have(1).errors_on(:email)
  end
  it "is invalid with a duplicate email" do
    user = User.create(username: "nomiS", email: "i@love.rails", password: "hai")
    expect(User.new(email: "i@love.rails")).to have(1).errors_on(:email)
  end
  it "is invalid without a password" do
    expect(User.new(password: nil)).to have(1).errors_on(:password)
  end
end
