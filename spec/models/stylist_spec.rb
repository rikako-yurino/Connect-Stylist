require 'rails_helper'

RSpec.describe Stylist, type: :model do
  before do
    @stylist = FactoryBot.build(:stylist)
  end


  describe 'スタイリスト新規会員登録' do
    context '内容に問題ない場合' do
      it 'すべての項目が存在すれば登録できること' do
        expect(@stylist).to be_valid
      end
    end
    
    context '内容に問題がある場合' do
      it 'プロフィール画像が空では登録できないこと' do
        @stylist.stylist_photo = nil
        @stylist.valid?
        expect(@stylist.errors.full_messages).to include("プロフィール画像を選択してください")
      end
      
      it 'emailが空では登録できないこと' do
        @stylist.email = ''
        @stylist.valid?
        expect(@stylist.errors.full_messages).to include("メールアドレスを入力してください")
      end

      it 'emailに@がない場合は登録できない' do
        @stylist.email = 'test.com'
        @stylist.valid?
        expect(@stylist.errors.full_messages).to include("メールアドレスは不正な値です")
      end
  
      it '重複したemailが存在する場合登録できないこと' do
        @stylist.save
        another_stylist = FactoryBot.build(:stylist)
        another_stylist.email = @stylist.email
        another_stylist.valid?
        expect(another_stylist.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
  
      it 'passwordが空では登録できないこと' do
        @stylist.password = ''
        @stylist.valid?
        expect(@stylist.errors.full_messages).to include("パスワードを入力してください")
      end
  
      it 'passwordが5文字以下では保存できないこと' do
        @stylist.password = '12345'
        @stylist.valid?
        expect(@stylist.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードは半角英数字を含んでください")
      end
  
      it 'passwordが英数字を含まなければ保存できないこと' do
        @stylist.password = '123456'
        @stylist.valid?
        expect(@stylist.errors.full_messages).to include("パスワードは半角英数字を含んでください")
      end

      it 'passwordが半角英語のみは登録できない' do
        @stylist.password = 'abcdef'
        @stylist.valid?
        expect(@stylist.errors.full_messages).to include("パスワードは半角英数字を含んでください")
      end

      it 'passwordが全角英数混合は登録できない' do
        @stylist.password = '１ａｂｃｄｅ'
        @stylist.valid?
        expect(@stylist.errors.full_messages).to include("パスワードは半角英数字を含んでください")
      end

      it 'passwordとpassword_confirmationが一致しないと登録できないこと' do
        @stylist.password = 'test12345'
        @stylist.password_confirmation = 'test123456'
        @stylist.valid?
        expect(@stylist.errors.full_messages).to include("確認パスワードとパスワードの入力が一致しません")
      end
  
      it 'passwordが存在してもpassword_confirmationが空では保存できないこと' do
        @stylist.password_confirmation = ''
        @stylist.valid?
        expect(@stylist.errors.full_messages).to include("確認パスワードとパスワードの入力が一致しません")
      end
  
      it 'last_nameが空では保存できないこと' do
        @stylist.last_name = ''
        @stylist.valid?
        expect(@stylist.errors.full_messages).to include("姓を入力してください")
      end
  
      it 'first_nameが空では保存できないこと' do
        @stylist.first_name = ''
        @stylist.valid?
        expect(@stylist.errors.full_messages).to include("名を入力してください")
      end

      it 'licenseが空では保存できないこと' do
        @stylist.license = ''
        @stylist.valid?
        expect(@stylist.errors.full_messages).to include("資格を入力してください")
      end

      it 'profileが空では保存できないこと' do
        @stylist.profile = ''
        @stylist.valid?
        expect(@stylist.errors.full_messages).to include("プロフィールを入力してください")
      end
    end
  end
end
