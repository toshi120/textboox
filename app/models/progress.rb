class Progress < ApplicationRecord
  belongs_to :students_textbook, dependent: :destroy

  validates :progress_page, :comment, presence: true
  
  #progress_pageにのマックスの数字をその参考書の総ページにするバリデーションを作成する
end
