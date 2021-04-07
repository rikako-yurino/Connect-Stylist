require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規会員登録' do
    context '内容に問題ない場合' do
      it 'すべての項目が存在すれば登録できること' do
        expect(@user).to be_valid
      end

    end
    
    context '内容に問題がある場合' do
      it 'プロフィール画像がなくては登録できないこと' do
        @user.user_photo = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("プロフィール画像を選択してください")
      end

      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end

      it 'emailに@がない場合は登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end
  
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
  
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
  
      it 'passwordが5文字以下では保存できないこと' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードは半角英数字を含んでください")
      end
  
      it 'passwordが英数字を含まなければ保存できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字を含んでください")
      end

      it 'passwordが半角英語のみは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字を含んでください")
      end

      it 'passwordが全角英数混合は登録できない' do
        @user.password = '１ａｂｃｄｅ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字を含んでください")
      end

      it 'passwordとpassword_confirmationが一致しないと登録できないこと' do
        @user.password = 'test12345'
        @user.password_confirmation = 'test123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("確認パスワードとパスワードの入力が一致しません")
      end
  
      it 'passwordが存在してもpassword_confirmationが空では保存できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("確認パスワードとパスワードの入力が一致しません")
      end
  
      it 'last_nameが空では保存できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end
  
      it 'last_nameが全角カナ漢字平仮名ではないとき保存できないこと' do
        @user.last_name = "lastname"
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を全角で入力してください")
      end
  
      it 'first_nameが空では保存できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end
  
      it 'first_nameが全角カナ漢字平仮名ではないとき保存できないこと' do
        @user.first_name = "firstname"
        @user.valid?
        expect(@user.errors.full_messages).to include("名を全角で入力してください")
      end
  
      it 'last_name_kanaが空では保存できないこと' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓カナを入力してください")
      end
  
      it 'last_name_kanaが全角カタカナではないとき保存できないこと' do
        @user.last_name_kana = "せい"
        @user.valid?
        expect(@user.errors.full_messages).to include("姓カナを全角カタカナで入力してください")
      end

      it 'last_name_kanaが半角文字だと保存できないこと' do
        @user.last_name_kana = 'ｾｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓カナを全角カタカナで入力してください")
      end
  
      it 'first_name_kanaが空では保存できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名カナを入力してください")
      end
  
      it 'first_name_kanaが全角カタカナではないとき保存できないこと' do
        @user.first_name_kana = "めい"
        @user.valid?
        expect(@user.errors.full_messages).to include("名カナを全角カタカナで入力してください")
      end

      it 'first_name_kanaが半角文字だと保存できないこと' do
        @user.first_name_kana = 'ﾒｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名カナを全角カタカナで入力してください")
      end
  
      it 'birthdayが空では保存できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      
      it 'お住いの地域が空では保存できないこと' do
        @user.prefecture_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お住いの地域を選んでください")
      end

      it 'お住いの地域の情報として、選択肢1では保存できないこと' do
        @user.prefecture_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("お住いの地域を選んでください")
      end
      
      it '職業が空では保存できないこと' do
        @user.work_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ご職業を選んでください")
      end

      it '職業の情報として、選択肢1では保存できないこと' do
        @user.work_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("ご職業を選んでください")
      end

      it 'あなたの骨格タイプが空では保存できないこと' do
        @user.frame_type_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("あなたの骨格タイプを選んでください")
      end

      it 'あなたの骨格タイプの情報として、選択肢1では保存できないこと' do
        @user.frame_type_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("あなたの骨格タイプを選んでください")
      end
    end
  end
end
