require 'rails_helper'

RSpec.describe User, type: :model do
 describe '#create' do
  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録がうまくいくとき' do
    it '必須項目を記入したら登録できること' do
      expect(@user).to be_valid
    end
    it 'パスワードを６文字以上記入したら登録できること' do
      @user.password = "kkkkkk"
      @user.password_confirmation = "kkkkkk"
      expect(@user).to be_valid
    end
  end

  context '新規登録がうまくいかないとき' do
    it 'パスワードが５文字以下の場合、登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードと確認用のパスワードが一致しなければ登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'emailが重複する場合、新規登録ができない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスに空白があると登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスに＠マークがなければ登録できない' do
      @user.email = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
  end

 end
end
