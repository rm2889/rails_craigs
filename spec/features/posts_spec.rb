require 'spec_helper'

describe "Posts" do
	context "view a single post" do
		let!(:category) {Category.create(name: "Personals")}
		let!(:post) {Post.create(title: "hey you", description: "tonight?", category: category)}
		it "displays the title and the content" do
			visit post_path(post.id)
			expect(page).to have_content('hey you')
			expect(page).to have_content('tonight?')
		end
	end
end
