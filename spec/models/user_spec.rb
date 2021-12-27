require 'rails_helper'
describe 'ストアモデル機能', type: :model do
  before do
    @user = FactoryBot.create(:second_user)
    @user1 = FactoryBot.create(:forth_user)
    @store = FactoryBot.create(:store,user_id: @user.id)
    @second_store = FactoryBot.create(:second_store,user_id: @user1.id)
  end
  describe 'バリデーションのテスト' do
    context 'ユーザーの名前が空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(name: '', email:'test@dd.com', status:'求職者')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのemailが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(name: 'test', email:'', status:'求職者')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのemailが大文字の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name:'test' ,email: 'AA@AA.com', status:'求職者')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのstatusが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name:'test' ,email: 'AA@AA.com', status:'')
        expect(user).not_to be_valid
      end
    end
  end
end
