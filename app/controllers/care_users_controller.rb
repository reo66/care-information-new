class CareUsersController < ApplicationController

  def new
    @use_day = ["月", "火", "水","木", "土", "日","祝", "長期休み"]
    @care_user = CareUser.new
  end

  def create
    @care_user = CareUser.new(care_user_params)
    # ↓参考：https://qiita.com/xusaku_/items/570b0be745901d2e9a63
    params[:care_user][:use_day] ? @care_user.use_day = params[:care_user][:use_day] .join(",") : false
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
    params.require(:care_user).permit(:image, :department, :name, :age, :gender, :school, :grade, :contract, :house,:disabled,:eat,:evacuation,:cange_clothes,:diapers, :allergy, :allergy_text,:seizures, :seizures_text, :medicine,:communicate_a,:communicate_summary_a,:communicate_b,:communicate_summary_b,:indoor,:outdoor,:summary, :checkbox,use_day:[])
  end

end
