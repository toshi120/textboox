class Textbook < ApplicationRecord
  has_one_attached :image
  has_many :students_textbooks
  has_many :students, through: :students_textbooks
end
