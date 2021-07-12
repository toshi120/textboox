class Textbook < ApplicationRecord
  has_one_attached :image
  has_many :students_textbooks, foreign_key: :textbook_id, dependent: :destroy
  has_many :students, through: :students_textbooks
  belongs_to :teacher

  validates :name, :note, :page, presence: true
  validates :page, numericality: { less_than_or_equal_to: 999_999 }
  validates :image, presence: {message: "を添付してください"}
end
