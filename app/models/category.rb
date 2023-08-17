class Category < ApplicationRecord
  belongs_to :user
  has_many :categorizations, dependent: :destroy  
  has_many :records, through: :categorizations

  def total_amount
    sum = 0
    records.each do |record|
      sum += record.amount
    end
    sum
  end
end
