require 'rails_helper'
RSpec.describe 'ユーザー登録のテスト', type: :system do
  before do
    @user = FactoryBot.create(:user,name: 'user01', email: 'user01@test.com')
    @second_user = FactoryBot.create(:second_user,name: 'user02', email: 'user02@test.com')
    @third_user = FactoryBot.create(:third_user,name: 'user03', email: 'user05@test.com')
  end
  describe 'ユーザーの新規登録' do
    context 'ユーザの新規登録ができること' do
      it 'ユーザが新規登録される' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'user01'
        fill_in 'user[email]', with: 'user03@test.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_on 'アカウント登録'
        #binding.irb
        expect(page).to have_content 'アカウント登録が完了しました'
      end
    end
  end
  describe 'ログインせずに一覧画面に飛ぼうとした時、ログイン画面に遷移する' do
    context 'ログインせずに一覧画面に飛ぼうとした時、ログイン画面に遷移する' do
      it 'ログイン画面に遷移する' do
        visit articles_path
        expect(page).to have_content 'ログイン'
      end
    end
  end
  describe 'セッション機能のテスト' do
    context 'ログインができること' do
      it 'ログインができること' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user01@test.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
    end
  end
  context 'ログアウトした場合' do 
    it 'ログアウトができること' do
      visit new_user_session_path
      fill_in 'user_email', with: 'user01@test.com'
      fill_in 'user_password', with: 'password'
      click_button 'ログイン'
      expect(page).to have_content 'ログインしました。'
      click_on 'ログアウト'
      expect(page).to have_content 'ログアウトしました。'
    end
  end
  describe '管理画面のテスト' do
    context '管理ユーザは管理画面にアクセスできること' do
      it '管理ユーザは管理画面にアクセスできること' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user02@test.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        click_link 'マイページ'
        click_link '管理者ログイン'
        expect(page).to have_content 'サイト管理'
      end
    end
  end
end