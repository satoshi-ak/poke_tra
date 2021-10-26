require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  describe 'バリデーションのテスト' do
    context '画像が未入力の場合' do
      it 'バリデーションにひっかかる' do
        article　= Article.new(
          title: "タイトル",
          content: "内容",
          image: "",
          country: "アメリカ",
          address: "アメリカ",
        )
        expect(article).not_to be_valid
      end
    end
  end
end

