class StudentsTextbook < ApplicationRecord
  belongs_to :student
  belongs_to :textbook
  has_many :progresses
end
