class Progress < ApplicationRecord
  belongs_to :students_textbook, dependent: :destroy
end
