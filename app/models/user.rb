class User < ApplicationRecord
  has_secure_password

  has_many :companies, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { minimun: 3, maximum: 20 }
  validates :name, format: { with: /\A[a-zA-Z0-9_]+(?: [a-zA-Z0-9_]+)*\z/ }

  validates :lastname, presence: true
  validates :lastname, length: { minimun: 3, maximum: 20 }
  validates :lastname, format: { with: /\A[a-zA-Z0-9_]+(?: [a-zA-Z0-9_]+)*\z/ }

  validates :username, presence: true
  validates :username, length: { minimun: 3, maximum: 20 }
  validates :username, format: { with: /\A[a-zA-Z0-9_]+(?: [a-zA-Z0-9_]+)*\z/ }
  validates :username, uniqueness: true
end