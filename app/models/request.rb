class Request < ApplicationRecord
  # include PgSearch::Model

  belongs_to :user
  has_one :exchange, dependent: :destroy

  validates :origin, presence: true
  validates :destination, presence: true

  REQUEST_TYPE = ["Folgar", "Trocar", "Trabalhar"]
  validates :request_type, presence: true
  validates :request_type, inclusion: { in: REQUEST_TYPE }

  validates :start_time, :end_time, presence: true
  validate :end_time_after_start_time

  private


  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_time, "Data inválida! Deve ser maior que a data da ida.")
    end
  end
end
