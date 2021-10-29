require 'rails_helper'

RSpec.describe 'Favorite', type: :system do
  describe 'お気に入り機能' do
    before do
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in "Eメール", with: "user01@test.com"
      fill_in "パスワード", with: "password"
      #binding.irb
      click_button 'ログイン'
    end
    describe 'お気に入り機能' do
      context 'お気に入りした場合' do
        it 'お気に入りできる' do
          visit new_article_path
          fill_in "article_title", with: "タイトル"
          fill_in "article_content", with: "内容"
          attach_file "#{Rails.root}/app/assets/images/IMG_7835.jpg"
          fill_in "article_country", with: "アメリカ"
          fill_in "article_address", with: "アメリカ"
          click_on '登録する'
          click_link 'Back'
          click_on 'Show'
          click_on 'お気に入りする'
          expect(page).to have_content 'さんのブログをお気に入り登録しました'
        end
      end
    end
    describe 'お気に入り機能' do
      context 'お気に入りした場合' do
        it 'お気に入りできる' do
          visit new_article_path
          fill_in "article_title", with: "タイトル"
          fill_in "article_content", with: "内容"
          attach_file "#{Rails.root}/app/assets/images/IMG_7835.jpg"
          fill_in "article_country", with: "アメリカ"
          fill_in "article_address", with: "アメリカ"
          click_on '登録する'
          click_link 'Back'
          click_on 'Show'
          click_on 'お気に入りする'
          expect(page).to have_content 'さんのブログをお気に入り登録しました'
        end
      end
      context 'お気に入り解除場合' do
        it 'お気に入り解除できる' do
          visit new_article_path
          fill_in "article_title", with: "タイトル"
          fill_in "article_content", with: "内容"
          attach_file "#{Rails.root}/app/assets/images/IMG_7835.jpg"
          fill_in "article_country", with: "アメリカ"
          fill_in "article_address", with: "アメリカ"
          click_on '登録する'
          click_link 'Back'
          click_on 'Show'
          click_on 'お気に入りする'
          click_on 'Show'
          click_on 'お気に入り解除する'
          expect(page).to have_content 'さんのブログをお気に入り解除しました'
        end
      end
      context 'お気に入りした場合' do
        it 'お気に入り一覧が表示される' do
          visit new_article_path
          fill_in "article_title", with: "タイトル"
          fill_in "article_content", with: "内容"
          attach_file "#{Rails.root}/app/assets/images/IMG_7835.jpg"
          fill_in "article_country", with: "アメリカ"
          fill_in "article_address", with: "アメリカ"
          click_on '登録する'
          click_link 'Back'
          click_on 'Show'
          click_on 'お気に入りする'
          click_on 'マイページ'
          click_on 'お気に入り一覧'
          expect(page).to have_content 'お気に入り一覧'
        end
      end
    end
  end
end
