class CareUsersController < ApplicationController

  def new
    @care_user = CareUser.new
  end

  def create
    @care_user = CareUser.new(care_user_params)
    if @care_user.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to @care_user
    else
      render :new
    end
  end 


  def show
    @care_user = CareUser.find(params[:id])
  end

  def index
    @care_users = CareUser.all
  end

  private

  def care_user_params
    params.require(:care_user).permit(:name, :age, :gender, :scool)
  end

end
