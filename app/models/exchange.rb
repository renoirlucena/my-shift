class Exchange < ApplicationRecord
  belongs_to :user
  belongs_to :request

  # after_create :new_exchange
end
