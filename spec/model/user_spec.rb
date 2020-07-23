require 'rails_helper'

RSpec.describe 'userモデルテスト', type: :model do

	describe 'バリデーションのテスト' do
	let(:user) { build(:user) }
	subject { test_user.valid? }
		context 'user_nameカラム' do
			let(:test_user){ user }
			it '空欄でないこと' do
				test_user.user_name =''
				is_expected.to eq false;
			end
		end

		context 'name_kanjiカラム' do
			let(:test_user){ user }
			it '空欄でないこと' do
				test_user.name_kanji =''
				is_expected.to eq false;
			end
		end

		context 'name_kanaカラム' do
			let(:test_user){ user }
			it '空欄でないこと' do
				test_user.name_kana =''
				is_expected.to eq false;
			end
			it '漢字でエラーになること' do
				test_user.name_kana = '田中'
				is_expected.to eq false;
			end
			it 'カタカナであること' do
				test_user.name_kana = 'タナカ'
				is_expected.to eq true;
			end
		end

	end

end

