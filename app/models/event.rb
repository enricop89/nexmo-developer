class Event < ApplicationRecord
  default_scope -> { order(:starts_at) }
  scope :upcoming, -> { where('ends_at > ?', Time.zone.today) }
  scope :past, -> { where('starts_at < ?', Time.zone.today).reverse_order }

  geocoded_by :address
  before_validation :geocode

  has_many :sessions, dependent: :nullify

  validates :title, presence: true
  validates :description, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :url, presence: true

  private

  def address
    [city, country].compact.join(', ')
  end
end
