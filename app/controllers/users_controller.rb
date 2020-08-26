class UsersController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]
  

  def index
    @users= User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user_edit = User.find(params[:id])
    if @user_edit != current_user
      redirect_to users_path, alert: "不正なアクセスです。"
    end
  end
  # var number = 1
  # console.log(number, '1111111')
  # console.log('2222222')

  def update
    @user_edit = User.find(params[:id])
    if @user_edit.update(user_params)
      redirect_to user_path(@user_edit), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
    
  end

end
