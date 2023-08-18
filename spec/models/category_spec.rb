require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      association = Category.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many categorizations that are dependent on destroy' do
      association = Category.reflect_on_association(:categorizations)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:dependent]).to eq(:destroy)
    end

    it 'has many records through categorizations' do
      association = Category.reflect_on_association(:records)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:categorizations)
    end
  end

  describe 'validations' do
    it 'validates presence of name' do
      category = Category.new
      expect(category.valid?).to be_falsey
      expect(category.errors[:name]).to include("can't be blank")
    end
  end

  describe '#total_amount' do
    it 'calculates the total amount of associated records' do
      category = instance_double('Category')

      record1 = instance_double('Record', amount: 100)
      record2 = instance_double('Record', amount: 200)

      allow(category).to receive(:records).and_return([record1, record2])

      expect(Category).to receive(:create).with(name: 'Test Category').and_return(category)
      expect(category).to receive(:total_amount).and_return(300)

      result = Category.create(name: 'Test Category').total_amount

      expect(result).to eq(300)
    end
  end
end
