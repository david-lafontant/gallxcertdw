class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :picture

  validates :picture, presence: true, on: :create
  validates :price,  presence: true, numericality: { greater_than: 0.05 }
  validates :name, presence: true, uniqueness: true, length: { in: 3..50 }
  validates :description, presence: true, length: { in: 3..1000 }
  validate :validate_picture

  validate :picture_presence_on_create

  private

  def picture_presence_on_create
    errors.add(:picture, "must be attached") if new_record? && !picture.attached?
  end

  def validate_picture
    return unless picture.attached?

    errors.add(:picture, "is too big, it shoulb be less than 5 MB") unless picture.blob.byte_size <= 5.megabyte
    acceptable_types = [ "image/jpeg", "image/png" ]
    return if acceptable_types.include?(picture.content_type)

    errors.add(:picture, "must be a JPEG or PNG")
  end
end
