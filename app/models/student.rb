class Student < ApplicationRecord
  has_many :students_textbooks, foreign_key: :student_id, dependent: :destroy
  has_many :textbooks, through: :students_textbooks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  def self.students_guest
    find_or_create_by!(email: 'student_guest@example.com') do |student|
      student.password = SecureRandom.urlsafe_base64
      student.name = '生徒用ゲストユーザー'
    end
  end
end
