class UsersController < ApplicationController

	before_action :set_current_user

  def show
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def user_params
  	params.raquire(:user).permit(:email, :password, :name_kanji, :name_kana, :user_name, :user_image, :mypoint_postcode, :mypoint_address)

  end

  def set_current_user
    @user = current_user
  end



end
