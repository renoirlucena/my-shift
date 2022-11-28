class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
  has_many :requests
  has_many :exchanges

  # validates :first_name, presence: true
  # validates :first_namUser.first.update(admin: true)e, length: { minimum: 3 }
  # #validates :first_name, format: { with: /[a-zA-Z\u00C0-\u00FF ]/i }

  # validates :last_name, presence: true
  # validates :last_name, length: { minimum: 2 }
  # #validates :last_name, format: { with: /[a-zA-Z\u00C0-\u00FF ]/i }

  # validates :email, presence: true, uniqueness: true
  # #validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

  # validates :CPF, presence: true, uniqueness: true
  # #validates :CPF, format: { with: /\A\d{3}\.\d{3}\.\d{3}\-\d{2}\Z/ }

  # validates :RE, presence: true, uniqueness: true
  # #validates :RE, format: { with: /\d+/ }

  # validates :phone, presence: true, uniqueness: true
  # #validates :phone, format: { with: /(\d{2})(\d{2})(\d{1})(\d{4})(\d{4})/ }
end
