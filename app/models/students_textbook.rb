class StudentsTextbook < ApplicationRecord
  belongs_to :student
  belongs_to :textbook
  has_many :progresses, foreign_key: :students_textbook_id, dependent: :destroy
end
