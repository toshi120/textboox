class Textbook < ApplicationRecord
  has_one_attached :image
  has_many :students_textbooks, foreign_key: :textbook_id, dependent: :destroy
  has_many :students, through: :students_textbooks

  validates :name, :note, :page, :image, presence: true
  validates :page, numericality: { less_than_or_equal_to: 999_999 }
end
