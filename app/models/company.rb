class Company < ApplicationRecord
  has_many :users

  validates :name, presence: true, uniqueness: true
  validates :name, format: { with: /[a-zA-Z\u00C0-\u00FF ]/ }
  validates :name, uniqueness: { case_sensitive: false }

  validates :CNPJ, presence: true, uniqueness: true
  validates :CNPJ, format: { with: /^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$/ }

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
end
