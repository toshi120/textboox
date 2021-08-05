class Teacher < ApplicationRecord
  has_many :textbooks
  has_many :progresses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  def self.teachers_guest
    find_or_create_by!(email: 'teacher_guest@example.com') do |teacher|
      teacher.password = 'guestteacher123'
      teacher.name = '先生用ゲストユーザー'
    end
  end
end
