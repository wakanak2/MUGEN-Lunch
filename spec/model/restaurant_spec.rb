require 'rails_helper'

RSpec.describe 'restaurantモデルテスト', type: :model do

	describe 'バリデーションのテスト' do
	let(:restaurant) { build(:restaurant) }
	subject { test_restaurant.valid? }
		context 'nameカラム' do
			let(:test_restaurant){ restaurant }
			it '空欄でないこと' do
				test_restaurant.name =''
				is_expected.to eq false;
			end
		end

		context 'name_kanaカラム' do
			let(:test_restaurant){ restaurant }
			it '空欄でないこと' do
				test_restaurant.name_kana ='kana'
				is_expected.to eq false;
			end
		end
		context 'postcodeカラム' do
			let(:test_restaurant){ restaurant }
			it '数字７桁であること' do
				test_restaurant.postcode ='000000'
				is_expected.to eq false;
			end
			it '数字７桁であること' do
				test_restaurant.postcode ='00000000'
				is_expected.to eq false;
			end
		end
		context 'addressカラム' do
			let(:test_restaurant){ restaurant }
			it '空欄でないこと' do
				test_restaurant.address =''
				is_expected.to eq false;
			end

		end
		context 'telカラム' do
			let(:test_restaurant){ restaurant }
			it '数字9桁でエラーとなること' do
				test_restaurant.tel ='122223333'
				is_expected.to eq false;
			end
			let(:test_restaurant){ restaurant }
			it '数字12桁でエラーとなること' do
				test_restaurant.tel ='111122223333'
				is_expected.to eq false;
			end
		end

		context 'seatカラム' do
			let(:test_restaurant){ restaurant }
			it '半角数字であること' do
				test_restaurant.seat = "15"
				is_expected.to eq true;
			end
		end

		context 'standingカラム' do
			let(:test_restaurant){ restaurant }
			it '空欄でないこと' do
				test_restaurant.standing =''
				is_expected.to eq false;
			end
		end
		context 'closedカラム' do
			let(:test_restaurant){ restaurant }
			it '空欄でないこと' do
				test_restaurant.closed =''
				is_expected.to eq false;
			end
		end
		context 'smokingカラム' do
			let(:test_restaurant){ restaurant }
			it '空欄でないこと' do
				test_restaurant.smoking =''
				is_expected.to eq false;
			end
		end
	end

end
