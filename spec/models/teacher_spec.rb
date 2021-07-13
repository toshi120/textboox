require 'rails_helper'

RSpec.describe Teacher, type: :model do
  before do
    @teacher = FactoryBot.build(:teacher)
  end

  describe '先生ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@teacher).to be_valid
      end

      it 'パスワードが6文字以上であれば登録できる' do
        @teacher.password = "aaa111"
        @teacher.password_confirmation = "aaa111"
        expect(@teacher).to be_valid
      end

      it 'パスワードが半角英数字が混合されていれば登録できる' do
        @teacher.password = "aaa111"
        @teacher.password_confirmation ="aaa111"
        expect(@teacher).to be_valid
      end
    end
  
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @teacher.name = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Nameを入力してください", "Nameは不正な値です")
      end
      it 'nameが日本語意外だと登録ができない' do
        @teacher.name = "Yamada"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Nameは不正な値です")
      end
      it 'emailが空では登録できない' do
        @teacher.email = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Emailを入力してください")
      end
      it 'emailに@が含まれていないと登録できない' do
        @teacher.email = "aaa.aaa.com"
        @teacher.valid? 
        expect(@teacher.errors.full_messages).to include("Emailは不正な値です")
      end
      it 'emailが重複していると登録できない' do
        another_teacher = FactoryBot.build(:teacher)
        another_teacher.email = "aaa@aaa.com"
        another_teacher.save
        @teacher.email = "aaa@aaa.com"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Emailはすでに存在します")
      end
      it 'passwordが空では登録できない' do
        @teacher.password = ""
        @teacher.password_confirmation = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Passwordを入力してください")
      end
      it '5文字以下のパスワードでは登録できない' do
        @teacher.password = "aaa11"
        @teacher.password_confirmation = "aaa11"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Passwordは6文字以上で入力してください")
      end
      it 'passwordは確認用含めて二回入力しないと登録できない' do
        @teacher.password_confirmation = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it "passwordが数字のみでは登録できない" do
        @teacher.password = "123456"
        @teacher.password_confirmation = "123456"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Passwordは不正な値です")
      end
      it "Passwordが英語のみでは登録できない" do
        @teacher.password = "abcdef"
        @teacher.password_confirmation = "abcdef"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Passwordは不正な値です")
      end
    end
  end
end
