require 'rails_helper'

RSpec.describe Progress, type: :model do
  before do
    @progress = FactoryBot.build(:progress)
  end

  describe '進捗記録' do
    context '進捗記録を残せるとき' do
      it '全ての項目に適切に記入されていれば登録できる' do
        expect(@progress).to be_valid
      end
    end

    context '進捗記録が残せないとき' do
      it '進んだページが空だと記録できない' do
        @progress.progress_page = ""
        @progress.valid?
        expect(@progress.errors.full_messages).to include("「進んだページ」を入力してください")
      end

      it '進んだページが半角数字でないと記録できない' do
        @progress.progress_page = "１００"
        @progress.valid?
        expect(@progress.errors.full_messages).to include("「進んだページ」は数値で入力してください")
      end

      it 'コメントが空だと記録できない' do
        @progress.comment = ""
        @progress.valid?
        expect(@progress.errors.full_messages).to include("「気になったこと、わからなかったこと」を入力してください")
      end
    end
  end
end
