require 'rails_helper'

RSpec.describe "ReservationRooms", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @reservation = Reservation.last
  end
  context 'チャット予約ができるとき'do
    it 'ログインしたユーザーはチャット予約ができる' do
      # ログインする
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # チャット予約ページへのリンクがある
      expect(page).to have_content('チャット予約')
      # 投稿ページに移動する
      visit new_reservation_path
      # フォームに情報を入力する
      fill_in "reservation_room_reservation_date",  with: Date.today
      select '10:00-11:00', from: "reservation_room[time_zone_id]"
      select '普段用', from: "reservation_room[purpose_id]"
      select 'カジュアル', from: "reservation_room[style_id]"
      fill_in 'reservation_room[remarks]', with:'お願いします'
      # 確認画面へを押すと確認ページに遷移する
      click_on '確認画面へ'
      #「予約確認」の文字がある
      expect(page).to have_content('予約確認')
      # 登録するとReservationモデルのカウントが1上がる
      click_on '登録する'
      change { Reservation.count }.by(1)
      # 登録するとRoomモデルのカウントが1上がる
      change { Room.count }.by(1)
      # 「予約が完了しました」の文字がある
      expect(page).to have_content('予約が完了しました')
      # トップページに遷移する
      visit root_path
      # マイページに移動する
      visit mypage_reservation_path(@user)
      #  マイページには先ほど予約した内容が存在する（テキスト）
      expect(page).to have_content(@reservation_room)
    end
  end
  # context 'ツイート投稿ができないとき'do
  #   it 'ログインしていないと新規投稿ページに遷移できない' do
  #     # トップページに遷移する
  #     visit root_path
  #     # 新規投稿ページへのリンクがない
  #     expect(page).to have_no_content('投稿する')
  #   end
  # end
end