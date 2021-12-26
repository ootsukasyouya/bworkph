require 'rails_helper'
RSpec.describe 'ストア管理機能', type: :system do
  describe '求職者が持つ機能' do
    before do
       second_user = FactoryBot.create(:second_user)
       forth_user = FactoryBot.create(:forth_user)
       fifth_user = FactoryBot.create(:fifth_user)
       FactoryBot.create(:store, user: second_user)
       FactoryBot.create(:second_store, user: forth_user)
       FactoryBot.create(:third_store, user: fifth_user)
      visit new_session_path
      click_on 'ゲストログイン'
      click_on '店舗一覧'
    end
    context '働き方で検索した場合' do
      it "検索キーワードを持つお店でで絞り込まれる" do
        select '登録制', from: 'q_how_to_work_eq'
        click_on '検索1'
        expect(page).to have_content '000000000'
      end
    end
    context '稼ぎ方を検索した場合' do
      it "検索キーワードを持つお店でで絞り込まれる" do
        select '月給', from: 'q_how_to_earn_eq'
        click_on '検索2'
        expect(page).to have_content 'test_store5'
      end
    end
    context '募集待遇を検索した場合' do
      it "検索キーワードを持つお店でで絞り込まれる" do
        select 'フリーター募集', from: 'q_treatment_eq'
        click_on '検索3'
        expect(page).to have_content 'test_store5'
      end
    end
    context '店舗の詳細を確認した場合' do
      it "店舗の詳細が表示される" do
        select 'フリーター募集', from: 'q_treatment_eq'
        click_on '検索3'
        click_on 'お店の詳細'
        expect(page).to have_content 'test5'
      end
    end
    context '店舗の詳細ページのmapを確認した場合' do
      it "mapが表示される" do
        select 'フリーター募集', from: 'q_treatment_eq'
        click_on '検索3'
        click_on 'お店の詳細'
        click_on '地図'
        expect(current_path).to eq maps_path
      end
    end
    context '店舗の詳細ページをお気に入りした場合' do
      it "お気に入り済みが表示される" do
        select 'フリーター募集', from: 'q_treatment_eq'
        click_on '検索3'
        click_on 'お店の詳細'
        expect(page).to have_content 'test5'
        click_on 'お気に入り'
        expect(page).to have_content 'お気に入り済み'
      end
    end
  describe '店舗が持つ機能' do
    before do
      second_user = FactoryBot.create(:second_user)
      forth_user = FactoryBot.create(:forth_user)
      fifth_user = FactoryBot.create(:fifth_user)
      FactoryBot.create(:store, user: second_user)
      FactoryBot.create(:second_store, user: forth_user)
      FactoryBot.create(:third_store, user: fifth_user)
      visit new_session_path
      click_on 'ゲストログイン'
      click_on 'ユーザー情報変更'
      select '店舗' , from: 'user_status'
      click_button '更新する'
    end
    context '店舗を新規作成した場合' do
      it '店舗のshowページが表示される' do
        click_on '店舗作成'
        fill_in 'store_name', with: 'newstore'
        fill_in 'store_profile', with: 'newprofile'
        fill_in 'store_station_name', with: 'station'
        fill_in 'store_addres', with: 'address'
        fill_in 'store_phone_number', with: '000000'
        select '登録制', from: 'store_how_to_work'
        select '月給', from: 'store_how_to_earn'
        select 'フリーター募集', from: 'store_treatment'
        select '駅チカ', from: 'store_go_to_work'
        select '接客業', from: 'store_skill'
        select '時給1000円以上', from: 'store_salary'
        select '早朝', from: 'store_time_zone'
        select '明るめ', from: 'store_atmosphere'
        select '平均年齢20代', from: 'store_age_group'
        select '北海道', from: 'store_prefecture_name'
        select '駅から徒歩10分以内', from: 'store_station_on_foot'
        click_on '登録する'
        expect(page).to have_content '新しい店舗作成へ'
      end
    end
    context '自分の店舗を作成した後に' do
      it '自分の店舗を削除することができる' do
        click_on '店舗作成'
        fill_in 'store_name', with: 'newstore'
        fill_in 'store_profile', with: 'newprofile'
        fill_in 'store_station_name', with: 'station'
        fill_in 'store_addres', with: 'address'
        fill_in 'store_phone_number', with: '000000'
        select '登録制', from: 'store_how_to_work'
        select '月給', from: 'store_how_to_earn'
        select 'フリーター募集', from: 'store_treatment'
        select '駅チカ', from: 'store_go_to_work'
        select '接客業', from: 'store_skill'
        select '時給1000円以上', from: 'store_salary'
        select '早朝', from: 'store_time_zone'
        select '明るめ', from: 'store_atmosphere'
        select '平均年齢20代', from: 'store_age_group'
        select '北海道', from: 'store_prefecture_name'
        select '駅から徒歩10分以内', from: 'store_station_on_foot'
        click_on '登録する'
        click_on '一覧'
        click_on 'お店の削除'
        page.driver.browser.switch_to.alert.accept
        expect(current_path).to eq new_store_path
      end
    end

  end
end
