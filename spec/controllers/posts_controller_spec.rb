require 'spec_helper'

describe PostsController do
	let(:post) {Post.create(title: "titler", description: "descriptioner")}
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

end
