require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'バリデーションのテスト' do
    context '名前が未入力の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: '', email:'user@test.com', password:'password')
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが未入力の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: 'user', email:'', password:'password')
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが形式と違う場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: 'user', email:'user.com', password:'password')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが未入力の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: 'user', email:'user@test.com', password:'')
        expect(user).not_to be_valid
      end  
    end
    context '名前、メールアドレス、パスワードが入力されてる場合' do
      it 'バリデーションが通る' do
        user = User.new(name: 'user', email:'user@test.com', password:'password')
        expect(user).to be_valid
      end
    end
  end
end