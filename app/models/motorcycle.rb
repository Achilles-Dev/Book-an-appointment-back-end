class Motorcycle < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates :model, presence: true
  validates :description, presence: true, length: { in: 1..10_000 }
  validates :duration_months, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
