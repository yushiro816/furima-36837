require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#criate' do
    before do
      @user = FactoryBot.build(:user)
    end
    it 'nicknameが空の場合登録できないこと' do
     @user.nickname = ''
     @user.valid?
     expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it 'emailが空の場合登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
    it 'emailは＠が含まれなければ登録できない' do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email is invalid")
    end
    it 'passwordがない場合登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end
    it 'encrypted_passwordがない場合登録できないこと' do
      @user.encrypted_password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Encrypted password can't be blank")
    end
    it 'family_nameがない場合登録できないこと' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Family name can't be blank")
    end
    it 'family_name_kanaが無い場合登録できないこと' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Family name kana can't be blank")
    end
    it 'first_nameがない場合登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name can't be blank")
    end
    it 'first_name_kanaが無い場合登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name kana can't be blank")
    end
    it 'birth_dayが無い場合登録できないこと' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Birth day can't be blank")
    end  
    it 'passwordが6文字以上である場合登録できること' do
      @user.password = '12345a'
      @user.password_confirmation = '12345a'
      expect(@user).to be_valid
    end
    it 'passwordが5文字以下で登録できないこと' do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordがencrypted_passwordと一致しない場合は登録できないこと' do
      @user.password = '12345a'
      @user.password_confirmation = 'a54321'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'family_nameが全角入力でなければ登録できないこと' do
      @user.family_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Family name is invalid")
    end
    it 'first_nameが全角入力でなければ登録できないこと' do
      @user.first_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name is invalid")
    end
    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.first_name = 'あいうえお'
      @user.valid?
      
    end
    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.first_name = 'あいうえお'
      @user.valid?
    end
  end
end
