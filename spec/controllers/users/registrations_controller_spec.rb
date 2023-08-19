require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    context 'with invalid params' do
      it 'does not create a new user' do
        user_count_before = User.count

        post :create, params: { user: { email: '' } }

        user_count_after = User.count
        expect(user_count_after).to eq(user_count_before)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
