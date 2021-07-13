require 'rails_helper'

RSpec.describe Textbook, type: :model do
  before do
    @textbook = FactoryBot.build(:textbook)
  end

  describe 'テキスト投稿' do
    context '投稿できるとき' do
      it '全ての項目に情報が適切に入力されていれば登録できる' do
        expect(@textbook).to be_valid
      end
    end

    context '投稿できないとき' do
      it '画像が添付されていないと投稿できない' do
        @textbook.image = nil
        @textbook.valid?
        expect(@textbook.errors.full_messages).to include("写真を添付してください")
      end

      it 'テキスト名が空だと登録できない' do
        @textbook.name = ""
        @textbook.valid?
        expect(@textbook.errors.full_messages).to include("テキスト名を入力してください")
      end

      it 'テキストの説明が空だと登録できない' do
        @textbook.note = ""
        @textbook.valid?
        expect(@textbook.errors.full_messages).to include("テキストの説明を入力してください")
      end

      it 'ページ数が空だと登録できない' do
        @textbook.page = ""
        @textbook.valid?
        expect(@textbook.errors.full_messages).to include("ページ数を入力してください", "ページ数は数値で入力してください")
      end

      it 'ページ数は半角数字意外だと登録できない' do
        @textbook.page = "１００"
        @textbook.valid?
        expect(@textbook.errors.full_messages).to include("ページ数は数値で入力してください")
      end
    end
  end
end

