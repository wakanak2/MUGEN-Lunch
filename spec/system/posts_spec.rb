require 'rails_helper'

describe '投稿のテスト' do
 let!(:user){create(:user)}
 let!(:restaurant){ create(:restaurant)}


	describe '投稿のテスト' do
		context '投稿画面へ遷移できる' do
			it '遷移できる' do
				visit new_restaurant_post_path
			end
		end
	end

end