require 'rails_helper'
RSpec.describe 'Article', type: :system do
  describe 'CRUD機能' do
    before do
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in "Eメール", with: "user01@test.com"
      fill_in "パスワード", with: "password"
      click_button 'ログイン'
    end
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
    context '編集した場合' do
      it '変更内容が表示される' do
        visit new_article_path
        fill_in "article_title", with: "タイトル"
        fill_in "article_content", with: "内容"
        attach_file "#{Rails.root}/app/assets/images/IMG_7835.jpg"
        fill_in "article_country", with: "アメリカ"
        fill_in "article_address", with: "アメリカ"
        click_on '登録する'
        click_link 'Back'
        click_on 'マイページ'
        click_on 'Edit'
        fill_in "article_title", with: "タイトル1"
        fill_in "article_content", with: "内容1"
        attach_file "#{Rails.root}/app/assets/images/IMG_7835.jpg"
        click_on '更新する'
        expect(page).to have_content '記事を更新しました！'
      end
    end
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

  describe 'アクセス制限' do
    before do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:second_user)
      visit new_user_session_path
      fill_in :user_email, with: 'user02@test.com'
      fill_in :user_password, with: 'password'
      click_button "ログイン"
    end
    let!(:article1) { FactoryBot.create(:article, user_id: @user1.id)}
    let!(:article2) { FactoryBot.create(:second_article, user_id: @user2.id)}
    context '他人の編集ページにアクセスした場合' do
      it 'アクセスできない' do
        visit edit_article_path(article2.id)
        expect(page).to have_content ''
      end
    end
    context '目的地別でarticle1検索をした場合' do
      it '検索ワードでヒットする情報のみ表示される' do
        visit articles_path
        #binding.irb
        fill_in 'q_title_or_country_cont', with: 'test_title1'
        click_on "検索"
        #binding.irb
        article_list = all('.article_title')
        expect(article_list[0]).to have_content ''
      end
    end
  end
end
    