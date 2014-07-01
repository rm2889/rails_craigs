require 'spec_helper'

describe PostsController do
	let!(:category) {Category.create(name: "Duder")}
	let!(:post) {Post.create(title: "titler", description: "descriptioner")}
	context "#show" do
		it "receives successful response" do
			get :show, id: post.id
			expect(response).to be_success
		end

		it "assigns post to @post" do 
			get :show, id: post.id
			expect(assigns(:post)).to eq post
		end
	end

	context "new" do
		it "receives successful response" do
			get :new, id: category.id
			expect(response).to be_success
		end
	end

	context "create" do
		it "creates a new post and increases the post count by 1" do
			expect {
			post :create#, post: {title: post.title, description: post.description}
			}.to change {Post.count}.by(1)
		end
	end
end
