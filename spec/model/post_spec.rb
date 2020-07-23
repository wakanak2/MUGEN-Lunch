require 'rails_helper'

    RSpec.describe 'Postモデルのテスト', type: :model do
        describe 'バリデーションのテスト' do
        let(:user) { create(:user) }
        let(:restaurant){ create(:restaurant)}
        let!(:post) { build(:post, user_id: user.id,restaurant_id: restaurant.id) }

            context 'commentカラム' do
                it '空欄でないこと' do
                  post.comment = ''
                  expect(post.valid?).to eq false;
                end

                it '200文字以下であること' do
                  post.comment = Faker::Lorem.characters(number:201)
                  expect(post.valid?).to eq false;
                end
            end

            context 'timeカラム' do
                it '空欄でないこと' do
                  post.time = ''
                  expect(post.valid?).to eq false;
                end
                it '半角数字であること' do
                  post.time = 15
                  expect(post.valid?).to eq true;
                end
            end

            context 'priceカラム' do
                it '空欄でないこと' do
                  post.price = ''
                  expect(post.valid?).to eq false;
                end
                it '半角数字であること' do
                  post.price = 15
                  expect(post.valid?).to eq true;
                end
            end
        end

        describe 'アソシエーションのテスト' do
            context 'Userモデルとの関係' do
              it 'ユーザとN:1となっている' do
                expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
              end
            end
            context 'Restaurantモデルとの関係' do
            it 'レストランとN:1となっている' do
              expect(Post.reflect_on_association(:restaurant).macro).to eq :belongs_to
            end
        end
    end
end