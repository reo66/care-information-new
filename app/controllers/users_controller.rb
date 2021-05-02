class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # 保存に成功した場合は、ここに記述した処理が実行されます。
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :department, :password, :password_confirmation)
    end
end

end
