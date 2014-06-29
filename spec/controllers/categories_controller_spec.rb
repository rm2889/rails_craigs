require 'spec_helper'

describe CategoriesController do
	context "#index" do
		it "successful response" do
			get :index
			expect(response).to be_success
		end

		it "assigns categories to @categories" do
			Category.create(name: "This be it")
			categories = Category.all
			get :index
			expect(assigns(:categories)).to eq categories
		end
	end
end
