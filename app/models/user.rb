class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :records, foreign_key: :author_id
  has_many :categories, through: :records

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }
  validates :password, presence: true, confirmation: true, length: Devise.password_length
end
