require 'rails_helper'

RSpec.describe RecordsController, type: :controller do
  let(:user) { create(:user, full_name: 'John Doe') }
  let(:category) { create(:category, user:) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index, params: { category_id: category.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new, params: { category_id: category.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new record' do
      expect do
        post :create,
             params: { category_id: category.id, record: { name: 'New Record', amount: 100, full_name: 'John Doe' } }
      end.to change(Record, :count).by(1)
      expect(response).to redirect_to(category_records_path(category))
    end
  end
end
