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

      it 'パスワードが6文字以上であれば登録できる' do
        @student.password = 'aaa111'
        @student.password_confirmation = 'aaa111'
        expect(@student).to be_valid
      end

      it 'パスワードが半角英数字が混合されていれば登録できる' do
        @student.password = 'aaa111'
        @student.password_confirmation = 'aaa111'
        expect(@student).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @student.name = ''
        @student.valid?
        expect(@student.errors.full_messages).to include('Nameを入力してください', 'Nameは不正な値です')
      end
      it 'nameが日本語意外だと登録ができない' do
        @student.name = 'Yamada'
        @student.valid?
        expect(@student.errors.full_messages).to include('Nameは不正な値です')
      end
      it 'emailが空では登録できない' do
        @student.email = ''
        @student.valid?
        expect(@student.errors.full_messages).to include('Emailを入力してください')
      end
      it 'emailに@が含まれていないと登録できない' do
        @student.email = 'aaa.aaa.com'
        @student.valid?
        expect(@student.errors.full_messages).to include('Emailは不正な値です')
      end
      it 'emailが重複していると登録できない' do
        another_student = FactoryBot.build(:student)
        another_student.email = 'aaa@aaa.com'
        another_student.save
        @student.email = 'aaa@aaa.com'
        @student.valid?
        expect(@student.errors.full_messages).to include('Emailはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @student.password = ''
        @student.password_confirmation = ''
        @student.valid?
        expect(@student.errors.full_messages).to include('Passwordを入力してください')
      end
      it '5文字以下のパスワードでは登録できない' do
        @student.password = 'aaa11'
        @student.password_confirmation = 'aaa11'
        @student.valid?
        expect(@student.errors.full_messages).to include('Passwordは6文字以上で入力してください')
      end
      it 'passwordは確認用含めて二回入力しないと登録できない' do
        @student.password_confirmation = ''
        @student.valid?
        expect(@student.errors.full_messages).to include('Password confirmationとPasswordの入力が一致しません')
      end
      it 'passwordが数字のみでは登録できない' do
        @student.password = '123456'
        @student.password_confirmation = '123456'
        @student.valid?
        expect(@student.errors.full_messages).to include('Passwordは不正な値です')
      end
      it 'Passwordが英語のみでは登録できない' do
        @student.password = 'abcdef'
        @student.password_confirmation = 'abcdef'
        @student.valid?
        expect(@student.errors.full_messages).to include('Passwordは不正な値です')
      end
    end
  end
end
