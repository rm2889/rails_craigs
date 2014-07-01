require 'spec_helper'

describe "Posts" do
	let!(:category) {Category.create(name: "Personals")}
	let!(:post) {Post.create(title: "hey you", description: "tonight?", category: category)}
	context "view a single post" do
		
		
		it "displays the title and the content" do
			visit post_path(post.id)
			expect(page).to have_content('hey you')
			expect(page).to have_content('tonight?')
		end
	end

	context "Create a new post" do
		it "displays a new post form on clicking New Post" do
			visit posts_path(category.id)
			click_on("New Post")
			expect(current_path).to eq(new_post_path)
			expect(page).to have_content("Title")
			expect(page).to have_content("Description")
		end

		# let!(:post2) {Post.create(title: "suck it", description: "you too", category: category)}
		it "clicking on 'Create!' will display the posts for that category, including the new post" do
			visit new_post_path(category.id)
			fill_in "Title", with: "suck it"
			fill_in "Description", with: "you too"
			click_on("Create!")
			expect(page).to have_content("suck it")
			expect(page).to have_content("you too")
		end
	end
end