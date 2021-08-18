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
      @user.password = "kkkkkk12"
      @user.password_confirmation = "kkkkkk12"
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

    it 'パスワードが半角英語のみの場合登録できない' do
      @user.password = 'rebornnewworld'
      @user.password_confirmation = 'rebornnewworld'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'パスワードが数字のみの場合登録できない' do
      @user.password = '1234567'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

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

    it '誕生日が空の場合登録できない' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it '姓が空白の場合登録できない' do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it '姓が全角以外の場合登録できない' do
      @user.last_name = "matsue"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      
    end

    it '名が空白の場合登録できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '名が全角以外の場合登録できない' do
      @user.first_name = "matsue"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it '姓（フリガナ）が空白の場合登録できない' do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it '姓（フリガナ）が全角以外の場合登録できない' do
      @user.last_name_kana = "matsue"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana カタカナを使用してください")
    end

    it '名（フリガナ）が空白の場合登録できない' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '名（フリガナ）が全角以外の場合登録できない' do
      @user.first_name_kana = "matsue"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana カタカナを使用してください")
    end
  end
 end 
