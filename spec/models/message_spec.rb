require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @stylist = FactoryBot.build(:stylist)
      @reservation_room = FactoryBot.build(:reservation_room, user_id: @user.id, stylist_id: @stylist.id)
    end

    describe 'message送信' do
      context '内容に問題ない場合' do
        it 'contentが存在していれば保存できること' do
          expect(@message).to be_valid
        end

        it 'userが紐付いていないくても保存できること' do
          @message.user = nil
          @message.valid?
          expect(@message).to be_valid
        end

        it 'stylistが紐付いていないくても保存できること' do
          @message.stylist = nil
          @message.valid?
          expect(@message).to be_valid
        end
      end

      context '内容に問題ない場合' do
        it 'contentとimageが空では保存できないこと' do
          @message.content = ''
          @message.valid?
          expect(@message.errors.full_messages).to include("Contentを入力してください")
        end

        it 'roomが紐付いていないと保存できないこと' do
          @message.room = nil
          @message.valid?
          expect(@message.errors.full_messages).to include("Roomを入力してください")
        end
      end
    end
  end
end
