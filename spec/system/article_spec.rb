require 'rails_helper'
RSpec.describe '記事投稿機能', type: :system do
  describe '一覧表示機能' do
    before do
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in "Eメール", with: "user01@test.com"
      fill_in "パスワード", with: "password"
      #binding.irb
      click_button 'ログイン'
    end
    describe '新規作成機能' do
      context '新規作成した場合' do
        it '作成した記事が表示される' do
          visit new_article_path
          fill_in "article_title", with: "タイトル"
          fill_in "article_content", with: "内容"
          attach_file "#{Rails.root}/app/assets/images/IMG_7835.jpg"
          fill_in "article_country", with: "アメリカ"
          fill_in "article_address", with: "アメリカ"
          click_on '登録する'
          expect(page).to have_content '記事を作成しました！'
        end
      end
    end
    describe '詳細表示' do
      context '詳細画面に遷移した場合' do
        it '該当ページの内容が表示される' do
          visit new_article_path
          fill_in "article_title", with: "タイトル"
          fill_in "article_content", with: "内容"
          attach_file "#{Rails.root}/app/assets/images/IMG_7835.jpg"
          fill_in "article_country", with: "アメリカ"
          fill_in "article_address", with: "アメリカ"
          click_on '登録する'
          click_link 'Back'
          click_on 'Show'
          expect(page).to have_content '詳細ページ'
        end
      end
    end
    describe 'マイページ表示' do
      context 'マイページに遷移した場合' do
        it '該当ページの内容が表示される' do
          visit new_article_path
          fill_in "article_title", with: "タイトル"
          fill_in "article_content", with: "内容"
          attach_file "#{Rails.root}/app/assets/images/IMG_7835.jpg"
          fill_in "article_country", with: "アメリカ"
          fill_in "article_address", with: "アメリカ"
          click_on '登録する'
          click_link 'Back'
          click_on 'マイページ'
          expect(page).to have_content 'のページ'
        end
      end
    end
    describe '編集画面表示' do
      context '編集画面に遷移した場合' do
        it '該当ページの内容が表示される' do
          visit new_article_path
          fill_in "article_title", with: "タイトル"
          fill_in "article_content", with: "内容"
          attach_file "#{Rails.root}/app/assets/images/IMG_7835.jpg"
          fill_in "article_country", with: "アメリカ"
          fill_in "article_address", with: "アメリカ"
          click_on '登録する'
          click_link 'Back'
          click_on 'マイページ'
          click_link 'Edit'
          fill_in "article_title", with: "タイトル1"
          fill_in "article_content", with: "内容1"
          attach_file "#{Rails.root}/app/assets/images/IMG_7835.jpg"
          click_on '更新する'
          expect(page).to have_content '記事を更新しました！'
        end
      end
    end
    describe '削除表示' do
      context '削除した場合' do
        it '該当ページが削除できる' do
          visit new_article_path
          fill_in "article_title", with: "タイトル"
          fill_in "article_content", with: "内容"
          attach_file "#{Rails.root}/app/assets/images/IMG_7835.jpg"
          fill_in "article_country", with: "アメリカ"
          fill_in "article_address", with: "アメリカ"
          click_on '登録する'
          click_link 'Back'
          click_on 'マイページ'
          click_on 'Destroy'
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content '記事を削除しました！'
        end
      end
    end
  end
end
    