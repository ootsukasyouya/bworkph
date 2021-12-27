require 'rails_helper'
describe 'ストアモデル機能', type: :model do
  before do
    @user = FactoryBot.create(:second_user)
    @user1 = FactoryBot.create(:forth_user)
    @store = FactoryBot.create(:store,user_id: @user.id)
    @second_store = FactoryBot.create(:second_store,user_id: @user1.id)
  end
  describe 'バリデーションのテスト' do
    context 'ストアの名前が空の場合' do
      it 'バリデーションにひっかる' do
        store = Store.new(name: '')
        expect(store).not_to be_valid
      end
    end
    context 'ストアのプロフィールが空の場合' do
      it 'バリデーションにひっかかる' do
        store = Store.new(profile: '')
        expect(store).not_to be_valid
      end
    end
    context 'ストアのプロフィールが空の場合' do
      it 'バリデーションにひっかかる' do
        store = Store.new(station_name: '')
        expect(store).not_to be_valid
      end
    end
    context 'ストアの住所が空の場合' do
      it 'バリデーションにひっかかる' do
        store = Store.new(addres: '')
        expect(store).not_to be_valid
      end
    end
    context 'ストアの電話番号が空の場合' do
      it 'バリデーションにひっかかる' do
        store = Store.new(phone_number: '')
        expect(store).not_to be_valid
      end
    end
  end
end
