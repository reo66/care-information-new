class CareUsersController < ApplicationController

  before_action :set_care_user, only: [:show, :edit,:update, :destroy]
  before_action :set_q, only: [:edit_index, :search]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy ]
  




  def new
    @care_user = CareUser.new
    @use_day = $days_of_the_week
    
  end

  def create

    @care_user = CareUser.new(care_user_params)
    # ↓参考：https://qiita.com/xusaku_/items/570b0be745901d2e9a63
    params[:care_user][:use_day] ? @care_user.use_day = params[:care_user][:use_day].join(",") : false
    if @care_user.save
      flash[:success] = '新規作成に成功しました。'
      send_message = "新規の利用者が登録されました。ご確認をお願い致します"
      CareUser.broad_push(send_message)
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
      send_message = "#{@care_user.name}の情報が更新されました。ご確認をお願い致します"
      CareUser.broad_push(send_message)
      redirect_to @care_user
    else
      render :edit      
    end
  end


  def show
  end


  
  def edit_index 
    @care_users = CareUser.page(params[:page]).per(10)
    if @care_users.update(care_user_two_params)
      @count =  Intermediate.page(params[:page]).where(user_id: current_user.id, confirmation: false, indication: "更新")
    end
  end


  def update_index
    @care_user = CareUser.find(params[:id])
    redirect_to care_users_edit_index_user_path(current_user)
  end
  


  def search
    @results = @q.result
    @count =  Intermediate.where(user_id: current_user.id, confirmation: false, indication: "更新") 

  end

  def destroy
    @care_user.destroy
    flash[:success] = "#{@care_user.name}のデータを削除しました。"
    redirect_to care_users_url
  end

  

  private

  def care_user_params
    params.require(:care_user).permit(:image, :department, :name, :age, :gender, :school, :grade, :contract, :house,:disabled,:eat,:evacuation,:cange_clothes,:diapers, :allergy, :allergy_text,:seizures, :seizures_text, :medicine,:communicate_a,:communicate_summary_a,:communicate_b,:communicate_summary_b,:indoor,:outdoor,:summary, use_day:[])
  end

  def care_user_two_params
    params.permit(:image, :department, :name, :age, :gender, :school, :grade, :contract, :house,:disabled,:eat,:evacuation,:cange_clothes,:diapers, :allergy, :allergy_text,:seizures, :seizures_text, :medicine,:communicate_a,:communicate_summary_a,:communicate_b,:communicate_summary_b,:indoor,:outdoor,:summary, use_day:[])
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
