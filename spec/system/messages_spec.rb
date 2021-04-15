require 'rails_helper'

RSpec.describe "Messages送信機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @stylist = FactoryBot.create(:stylist)
    @reservation = FactoryBot.create(:reservation,  user_id: @user.id)
    @room = FactoryBot.create(:room, user_id: @user.id, reservation_id: @reservation.id)
    @message = Message.last
  end

  context 'ユーザー側' do
    it 'message送信に成功すると、message内容が表示されている' do
      # サインインする
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # マイページに移動する
      visit mypage_reservation_path(@user)
      #  マイページには先ほど予約した内容が存在する（テキスト）
      expect(page).to have_content(@room.reservation.reservation_date)
      # 予約内容をクリック
      click_on "#{@room.reservation.reservation_date}"
      # チャットルームへ遷移する
      visit "/reservations/#{@reservation.id}/rooms/#{@room.id}"
      # フォームにmessageを入力する
      fill_in 'input', with:'こんにちは'
      # 送信した値がDBに保存されていることを確認する
      expect{
        find_by_id('send-button').click
      }.to change { Message.count }.by(1)

      # 送信したmessageがブラウザに表示されていることを確認する
      expect(page).to have_content('こんにちは')
    end

    it '送る値が空の為、message送信に失敗すること' do
    # サインインする
    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # マイページに移動する
    visit mypage_reservation_path(@user)
    #  マイページには先ほど予約した内容が存在する（テキスト）
    expect(page).to have_content(@room.reservation.reservation_date)
    # 予約内容をクリック
    click_on "#{@room.reservation.reservation_date}"
    # チャットルームへ遷移する
    visit "/reservations/#{@reservation.id}/rooms/#{@room.id}"
    #  フォームにmessageを入力せずに送信すると保存されない
    expect{
      find_by_id('send-button').click
    }.to change { Message.count }.by(0)
    end
  end

  context 'スタイリスト側' do
    it 'message送信に成功すると、message内容が表示されている' do
      # サインインする
      visit new_stylist_session_path
      fill_in 'stylist[email]', with: @stylist.email
      fill_in 'stylist[password]', with: @stylist.password
      find('input[name="commit"]').click
      expect(current_path).to eq(stylists_path)
      # スタイリストのトップページには予約一覧が表示されている
      expect(page).to have_content(@room.reservation.reservation_date)
      # 予約内容をクリック
      click_on "#{@room.reservation.reservation_date}"
      # 確認画面で「入室」ボタンをクリックする
      click_on "入室"
      # チャットルームへ遷移する
      visit "/reservations/#{@reservation.id}/rooms/#{@room.id}"
      # フォームにmessageを入力する
      fill_in 'input', with:'こんばんは'
      # 送信した値がDBに保存されていることを確認する
      expect{
        find_by_id('send-button').click
      }.to change { Message.count }.by(1)

      # 送信したmessageがブラウザに表示されていることを確認する
      expect(page).to have_content('こんばんは')
    end

    it '送る値が空の為、message送信に失敗すること' do
      # サインインする
      visit new_stylist_session_path
      fill_in 'stylist[email]', with: @stylist.email
      fill_in 'stylist[password]', with: @stylist.password
      find('input[name="commit"]').click
      expect(current_path).to eq(stylists_path)
      # スタイリストのトップページには予約一覧が表示されている
      expect(page).to have_content(@room.reservation.reservation_date)
      # 予約内容をクリック
      click_on "#{@room.reservation.reservation_date}"
      # 確認画面で「入室」ボタンをクリックする
      click_on "入室"
      # チャットルームへ遷移する
      visit "/reservations/#{@reservation.id}/rooms/#{@room.id}"
      #  フォームにmessageを入力せずに送信すると保存されない
      expect{
        find_by_id('send-button').click
      }.to change { Message.count }.by(0)
    end
  end
end

