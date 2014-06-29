require 'spec_helper'

# As a user, I'd like to view all categories in a page DONE
# As a user, I'd like to click on a category and view all the posts for that particular category DONE
# As a user, I'd like to click on a post and be able to view the title and description for the post DONE
# As a user, I'd like to be able to create a new post for a particular category
# As a user, I'd like to be able to edit a post
# As a user, I'd like to be able to delete a post

describe "Categories" do
	context "view all categories" do
		let!(:category) {Category.create(name: "Personals")}
		let!(:post) {Post.create(title: "hey you", description: "tonight?", category: category)}
		it "displays all categories on visiting the home page" do
			visit root_path
			expect(page).to have_content('Personals')
		end

		it "displays all the posts for a particular category on clicking a category" do
			visit root_path
			click_on (category.name)
			expect(page).to have_content('hey you')
		end
	end
end
