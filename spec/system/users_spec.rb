require 'rails_helper'

describe 'ユーザー認証のテスト' do
  describe 'ユーザー新規登録' do
    before do
      visit new_user_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'user[user_name]', with: Faker::Internet.username(specifier: 5)
        fill_in 'user[name_kanji]', with: Faker::Internet.username_kanji(specifier: 5)
        fill_in 'user[name_kana]', with: Faker::Internet.username_kana(specifier: 5)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '新規登録'

        expect(page).to have_content 'successfully'
      end
      it '新規登録に失敗する' do
        fill_in 'user[user_name]', ''
        fill_in 'user[name_kanji]', ''
        fill_in 'user[name_kana]', ''
        fill_in 'user[email]', ''
        fill_in 'user[password]', ''
        fill_in 'user[password_confirmation]', ''
        click_button '新規登録'

        expect(page).to have_content 'error'
      end
    end
  end

    describe 'ユーザーログイン' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_user) { user }
      it 'ログインに成功する' do
        fill_in 'user[email]', with: test_user.email
        fill_in 'user[password]', with: test_user.password
        click_button 'ログイン'

        expect(page).to have_content 'successfully'
      end

      it 'ログインに失敗する' do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'

        expect(current_path).to eq(new_user_session_path)
      end
    end
  end
end

describe 'ユーザーのテスト' do
  let(:user) { create(:user) }
  let!(:test_user2) { create(:user) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe '編集のテスト' do
    context '自分の編集画面への遷移' do
      it '遷移できる' do
        visit edit_user_path(user)
        expect(current_path).to eq('/users/' + user.id.to_s + '/edit')
      end
    end
    context '他人の編集画面への遷移' do
      it '遷移できない' do
        visit edit_user_path(test_user2)
        expect(current_path).to eq('/users/' + user.id.to_s)
      end
    end

    context '表示の確認' do
      before do
        visit edit_user_path(user)
      end
      it '名前編集フォームに自分のユーザ名が表示される' do
        expect(page).to have_field 'user[user_name]', with: user.user_name
      end
      it '名前編集フォームに自分の名前（漢字）が表示される' do
        expect(page).to have_field 'user[name]', with: user.name_kanji
      end
      it '名前編集フォームに自分の名前（かな）が表示される' do
        expect(page).to have_field 'user[name]', with: user.name_kana
      end
      it '名前編集フォームに自分のメールアドレスが表示される' do
        expect(page).to have_field 'user[name]', with: user.email
      end
      it '画像編集フォームが表示される' do
        expect(page).to have_field 'user[profile_image]'
      end
      it '自己紹介編集フォームに自分の自己紹介が表示される' do
        expect(page).to have_field 'user[introduction]', with: user.introduction
      end
      it 'マイポイントフォームに自分の郵便番号が表示される' do
        expect(page).to have_field 'user[mypoint_postcode]', with: user.mypoint_postcode
      end
      it 'マイポイントフォームに自分の住所が表示される' do
        expect(page).to have_field 'user[mypoint_address]', with: user.mypoint_address
      end
      it '編集に成功する' do
        click_button '更新する'
        expect(page).to have_content 'successfully'
        expect(current_path).to eq('/users/' + user.id.to_s)
      end
      it '編集に失敗する' do
        fill_in 'user[user_name]', with: ''
        click_button '更新する'
        expect(page).to have_content 'error'
        expect(current_path).to eq('/users/' + user.id.to_s)
      end
    end
  end
end
