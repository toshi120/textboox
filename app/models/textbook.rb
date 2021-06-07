class Textbook < ApplicationRecord
  has_one_attached :image
  has_many :students_textbooks, foreign_key: :textbook_id, dependent: :destroy
  has_many :students, through: :students_textbooks
end
