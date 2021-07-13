require 'rails_helper'

RSpec.describe Student, type: :model do
  before do
    @student = FactoryBot.build(:student)
  end

  describe '生徒ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@student).to be_valid
      end
    end
  end
end
