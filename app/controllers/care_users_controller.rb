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
    params.require(:care_user).permit(:image, :department, :name, :age, :gender, :scool, :contract,:use_day,:house,:disabled,:eat,:evacuation,:cange_clothes,:diapers,:pat,:allergy,:seizures,:medicine,:communicate_a,:communicate_summary_a,:communicate_b,:communicate_summary_b,:indoor,:outdoor,:summary,:cuser_confirm)
  end

end
