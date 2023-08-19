require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user, full_name: 'John Doe') } 
  let(:category) { create(:category, user:) }

  before do
    sign_in user 
  end

  describe 'GET #index' do
    before do
      sign_in user 
    end
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns categories that belong to the current user' do
      category1 = create(:category, user:)
      create(:category)

      get :index
      expect(assigns(:categories)).to match_array([category, category1])
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns a new category' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the category' do
      category_to_destroy = create(:category, user:)
      expect do
        delete :destroy, params: { id: category_to_destroy.id }
      end.to change(Category, :count).by(-1)
    end

    it 'redirects to the categories index' do
      delete :destroy, params: { id: category.id }
      expect(response).to redirect_to(categories_path)
    end
  end
end
