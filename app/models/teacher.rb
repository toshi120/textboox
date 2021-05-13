class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
end
