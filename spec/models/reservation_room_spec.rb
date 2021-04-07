require 'rails_helper'

RSpec.describe ReservationRoom, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @reservation_room = FactoryBot.build(:reservation_room, user_id: @user.id)
  end

  describe 'チャット予約' do
    context '内容に問題ない場合' do
      it '必要な情報を適切に入力すると、予約情報がデータベースに保存されること' do
        expect(@reservation_room).to be_valid
      end

      it '予約情報として、備考欄に入力がなくても保存できること' do
        @reservation_room.remarks = " "
        expect(@reservation_room).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'user_id情報は必須であること' do
        @reservation_room.user_id = nil
        @reservation_room.valid?
        expect(@reservation_room.errors.full_messages).to include("Userを入力してください")
      end

      it 'reservation_date情報は必須であること' do
        @reservation_room.reservation_date = nil
        @reservation_room.valid?
        expect(@reservation_room.errors.full_messages).to include("日付を入力してください")
      end

      it 'time_zone_id情報は必須であること' do
        @reservation_room.time_zone_id = nil
        @reservation_room.valid?
        expect(@reservation_room.errors.full_messages).to include("時間を選んでください")
      end

      it 'reservation_date情報は1だと保存できないこと' do
        @reservation_room.time_zone_id = 1
        @reservation_room.valid?
        expect(@reservation_room.errors.full_messages).to include("時間を選んでください")
      end

      it 'purpose_id情報は必須であること' do
        @reservation_room.purpose_id = nil
        @reservation_room.valid?
        expect(@reservation_room.errors.full_messages).to include("お探しのスタイリングの用途を選んでください")
      end

      it 'purpose_id情報は1だと保存できないこと' do
        @reservation_room.purpose_id = 1
        @reservation_room.valid?
        expect(@reservation_room.errors.full_messages).to include("お探しのスタイリングの用途を選んでください")
      end

      it 'style_id情報は必須であること' do
        @reservation_room.style_id = nil
        @reservation_room.valid?
        expect(@reservation_room.errors.full_messages).to include("好きなファッションのスタイルを選んでください")
      end

      it 'style_id情報は1だと保存できないこと' do
        @reservation_room.style_id = 1
        @reservation_room.valid?
        expect(@reservation_room.errors.full_messages).to include("好きなファッションのスタイルを選んでください")
      end

      it 'style_id情報は必須であること' do
        @reservation_room.style_id = nil
        @reservation_room.valid?
        expect(@reservation_room.errors.full_messages).to include("好きなファッションのスタイルを選んでください")
      end
    end
  end
end