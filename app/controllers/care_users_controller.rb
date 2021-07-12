class CareUsersController < ApplicationController

  before_action :set_care_user, only: [:show, :edit, :edit_index,:update, :destroy]
  before_action :set_q, only: [:edit_index, :search]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy ]


  def new
    @use_day = $days_of_the_week
    @care_user = CareUser.new
  end

  def create
    @care_user = CareUser.new(care_user_params)
    # ↓参考：https://qiita.com/xusaku_/items/570b0be745901d2e9a63
    params[:care_user][:use_day] ? @care_user.use_day = params[:care_user][:use_day].join(",") : false
    if @care_user.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to @care_user
    else
      render :new
    end
  end 

  def edit
    @use_day = $days_of_the_week
  end

  def update
    if @care_user.update_attributes(care_user_params)
      @intermediate = Intermediate.where(care_user_id: params[:id])
      @intermediate.update(confirmation: false,indication: "更新" )
      flash[:success] = "利用者情報を更新しました。"
      redirect_to @care_user
    else
      render :edit      
    end
  end


  def show
  end


  def edit_index
    @care_users = CareUser.page(params[:page]).per(5)
    if @care_user.update(care_user_params)
      @count =  Intermediate.where(user_id: current_user.id, confirmation: false, indication: "更新")
    end
  end


  def update_index
    @care_user = CareUser.find(params[:id])
    redirect_to care_users_edit_index_user_path(current_user)
  end


  # def addition
  #   @user = User.find(params[:user_id])
  #   @care_user = CareUser.find(params[:care_user_id])
  #   user = User.find(params[:user_id])
  #   care_user = CareUser.find(params[:care_user_id])
  #   @care_user.users << user
  #   @user.care_users << care_user
  # end
  


  def search
    @results = @q.result
  end

  def destroy
    @care_user.destroy
    flash[:success] = "#{@care_user.name}のデータを削除しました。"
    redirect_to care_users_url
  end

  

  private

  def care_user_params
    params.permit(:image, :department, :name, :age, :gender, :school, :grade, :contract, :house,:disabled,:eat,:evacuation,:cange_clothes,:diapers, :allergy, :allergy_text,:seizures, :seizures_text, :medicine,:communicate_a,:communicate_summary_a,:communicate_b,:communicate_summary_b,:indoor,:outdoor,:summary, :cuser_confirm, use_day:[])
  end

  def confirm_params
    params.require(:care_user).permit(:cuser_confirm)
  end


  def set_care_user
    @care_user = CareUser.find(params[:id])
  end

  def set_q
    @q = CareUser.ransack(params[:q])
  end
end
