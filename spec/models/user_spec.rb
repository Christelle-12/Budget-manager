require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(full_name: 'John Doe', email: 'test@example.com', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end

    it 'is not valid without a full name' do
      user = User.new(email: 'test@example.com', password: 'password', password_confirmation: 'password')
      expect(user).not_to be_valid
    end

  end

  context 'associations' do
    it 'has many records' do
      association = described_class.reflect_on_association(:records)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many categories through records' do
      association = described_class.reflect_on_association(:categories)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:records)
    end
  end
end
