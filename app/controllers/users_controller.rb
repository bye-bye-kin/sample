class UsersController < ApplicationController
  def index
    @users= User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    puts '000000000'
    @user_edit = User.find(params[:id])
    puts @user_edit.inspect, '11111111111'
    puts '22222222222'
  end
  # var number = 1
  # console.log(number, '1111111')
  # console.log('2222222')

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
    
  end

  private
  def user_params
    params.require(:user).permit(:user, :email, :profile, :profile_image)
    
  end

end
