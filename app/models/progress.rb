class Progress < ApplicationRecord
  belongs_to :students_textbook, dependent: :destroy
  belongs_to :teacher, dependent: :destroy

  validates :progress_page, :comment, presence: true
  validates :progress_page, numericality: true

  # progress_pageにのマックスの数字をその参考書の総ページにするバリデーションを作成する
end
