class Membership < ApplicationRecord
  monetize :price_cents # stripe payment
end
