class Company < ApplicationRecord
  belongs_to :user

  has_many :periods
  has_many :employees

  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 20 }
  validates :name, format: { with: /\A[a-zA-Z0-9_]+(?: [a-zA-Z0-9_]+)*\z/ }
end
