require 'spec_helper'

describe CategoriesController do
  describe 'get#index' do
    it "renders the root page" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'get#show' do
  end
end
