class Membership < ApplicationRecord
  monetize :price_cents # stripe payment
  has_many :orders, dependent: :destroy
end
