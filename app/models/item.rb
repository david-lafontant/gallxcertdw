class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :picture

  validates :picture, presence: true
  validates :price,  presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :name, presence: true, uniqueness: true, length: { in: 6..50 }
  validates :description, presence: true, length: { in: 6..1000 }
  validate :validate_picture

  private

  def validate_picture
    return unless picture.attached?

    errors.add(:picture, "is too big, it shoulb be less than 5 MB") unless poster.blob.byte_size <= 5.megabyte
    acceptable_types = [ "image/jpeg", "image/png" ]
    return if acceptable_types.include?(picture.content_type)

    errors.add(:poster, "must be a JPEG or PNG")
  end
end
