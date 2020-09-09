require 'rails_helper'

RSpec.describe "Posts",type :request do
	describe '新規投稿ページ' do
		context "新規投稿ページが正しく表示される" do
			before do
				get new_restaurant_post_path
			end

			it 'リクエストは200 okとなること' do
				expect(response.status).to eq 200
			end
		end
	end

	describe '投稿編集ページ' do
		context "投稿編集ページが正しく表示される" do
			before do
				get edit_restaurant_post_path
			end

			it 'リクエストは200 okとなること' do
				expect(response.status).to eq 200
			end
		end
	end
end
