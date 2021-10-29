require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    user = FactoryBot.create(:user)
  end
  
  describe 'バリデーションのテスト' do
    context 'タイトルが未入力の場合' do
      it 'バリデーションにひっかかる' do
        article = Article.new(title: '', content:'内容', image: open("./app/assets/images/IMG_7835.jpg"), country: "アメリカ", address: "アメリカ")
        expect(article).not_to be_valid
      end
    end
    context '内容がが未入力の場合' do
      it 'バリデーションにひっかかる' do
        article = Article.new(title: 'article', content:'', image: open("./app/assets/images/IMG_7835.jpg"), country: "アメリカ", address: "アメリカ")
        expect(article).not_to be_valid
      end
    end
    context '画像が未入力の場合' do
      it 'バリデーションにひっかかる' do
        article = Article.new(title: 'article', content:'内容', image:"", country: "アメリカ", address: "アメリカ")
        expect(article).not_to be_valid
      end
    end
    context '住所が未入力の場合' do
      it 'バリデーションにひっかかる' do
        article = Article.new(title: 'article', content:'内容', image: open("./app/assets/images/IMG_7835.jpg"), country: "アメリカ", address: "")
        expect(article).not_to be_valid
      end  
    end
    context '全てが入力された場合' do
      it 'バリデーションが通る' do
        article = Article.new(title: 'article', content:'内容', image: open("./app/assets/images/IMG_7835.jpg"), address: "アメリカ")
        expect(article).not_to be_valid
      end
    end
  end
end