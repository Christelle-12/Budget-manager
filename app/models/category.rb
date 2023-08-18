class Category < ApplicationRecord
  belongs_to :user
  has_many :categorizations, dependent: :destroy
  has_many :records, through: :categorizations

  def total_amount
    records.sum(:amount)
  end

  validates :name, presence: true
end
