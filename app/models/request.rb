class Request < ApplicationRecord
  # include PgSearch::Model

  belongs_to :user
  has_one :exchange

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :origin, presence: true
  validates :destination, presence: true

  REQUEST_TYPE = ["Folga", "Troca", "Extra"]
  validates :request_type, presence: true
  validates :request_type, inclusion: { in: REQUEST_TYPE }
end
