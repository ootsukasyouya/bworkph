require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  describe 'ユーザ登録のテスト' do
    context 'ユーザを新規作成した場合' do
      it 'プロフィールを確認できる' do
        visit new_user_path
        fill_in 'user_name', with: 'newuser'
        fill_in 'user_email', with: 'new@gmail.com'
        select '求職者' , from: 'user_status'
        fill_in 'user_password', with: 'test123'
        fill_in 'user_password_confirmation', with: 'test123'
        click_button '登録する'
        expect(page).to have_content 'マイページ'
      end
    end
    context 'ユーザがユーザー情報を変更した場合' do
      it '情報が変更される' do
        visit new_session_path
        click_on 'ゲストログイン'
        click_on 'ユーザー情報変更'
        fill_in 'user_name', with: '変更した名前'
        click_button '更新する'
        expect(page).to have_content '変更した名前'
      end
    end
  end

  describe 'セッション機能のテスト' do
    before do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:second_user)
      @third_user = FactoryBot.create(:third_user)
    end
    context 'ユーザーがログインした場合' do
      it 'ログインができる' do
        visit new_session_path
        fill_in 'session_email', with: 'test1@email.com'
        fill_in 'session_password', with: 'test123'
        click_button 'Log in'
        expect(page).to have_content 'test1'
      end
    end
    context 'ユーザーがログインした時' do
      it 'マイページに飛べる' do
        visit new_session_path
        fill_in 'session_email', with: 'test1@email.com'
        fill_in 'session_password', with: 'test123'
        click_button 'Log in'
        expect(current_path).to eq current_path
      end
    end
    context 'ユーザーがログアウトした時'do
      it 'ログイン画面に戻る'do
      visit new_session_path
      fill_in 'session_email', with: 'test1@email.com'
      fill_in 'session_password', with: 'test123'
      click_button 'Log in'
      click_on 'ログアウト'
      sleep(1)
      expect(current_path).to eq new_session_path
      end
    end
  end

  describe '管理画面のテスト' do
    before do
      @user = FactoryBot.create(:user)
    end
    context '管理ユーザが管理画面にアクセスした時' do
      it '管理画面を表示' do
        visit new_session_path
        click_on 'ゲスト管理者'
        visit admin_users_path
        expect(current_path).to eq admin_users_path
      end
    end
    context '一般ユーザが管理画面にアクセスした時' do
      it '権限がありません' do
        visit new_session_path
        fill_in 'session_email', with: 'test1@email.com'
        fill_in 'session_password', with: 'test123'
        click_button 'Log in'
        visit admin_users_path
        expect(page).to have_content '管理者以外はアクセスできません'
      end
    end
    context '管理ユーザが編集画面で名前を変更した時' do
      it '一覧画面で名前が変更される' do
        visit new_session_path
        click_on 'ゲスト管理者'
        visit admin_users_path
        all('tbody tr')[0].click_link '編集'
        fill_in 'user_name', with: '変更した名前'
        click_button '編集する'
        expect(page).to have_content '変更した名前'
      end
    end
    context '管理者がユーザを削除した時' do
      it '一覧画面からユーザが削除される' do
        visit new_session_path
        click_on 'ゲスト管理者'
        visit admin_users_path
        all('tbody tr')[1].click_link '削除'
        expect(User.count).to eq 1
      end
    end
  end
end
