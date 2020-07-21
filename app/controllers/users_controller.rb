class UsersController < ApplicationController
  before_action :authenticate_user!
	before_action :set_current_user

  def show
  end

  def edit
  end

  def update
    if  @user.update(user_params)
        flash[:notice] = "情報を更新しました。"
        redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user.update(admission_status: false)
    reset_session
    flash[:notice] = "今までありがとうございました！またのご利用をお待ちしております。"
    redirect_to root_path
  end

  private

  def user_params
  	params.require(:user).permit(:email,
                                 :name_kanji,
                                 :name_kana,
                                 :user_name,
                                 :user_image,
                                 :mypoint_postcode,
                                 :mypoint_address,
                                 :introduction)

  end

  def set_current_user
    @user = current_user
  end

end
