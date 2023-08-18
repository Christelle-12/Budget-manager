require 'rails_helper'

RSpec.describe Record, type: :model do
  context 'associations' do
    it 'belongs to an author' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
      expect(association.options[:class_name]).to eq('User')
    end

    it 'has many categorizations' do
      association = described_class.reflect_on_association(:categorizations)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many categories through categorizations' do
      association = described_class.reflect_on_association(:categories)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:categorizations)
    end
  end

  context 'validations' do
    it 'requires name to be present' do
      record = described_class.new(name: nil)
      expect(record).not_to be_valid
      expect(record.errors[:name]).to include("can't be blank")
    end

    it 'requires amount to be greater than or equal to 0' do
      record = described_class.new(amount: -1)
      expect(record).not_to be_valid
      expect(record.errors[:amount]).to include("must be greater than or equal to 0")
    end
  end
end
