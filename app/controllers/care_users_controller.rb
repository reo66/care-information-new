class CareUsersController < ApplicationController

  before_action :set_care_user, only: [:show, :edit,:update, :destroy]
  before_action :set_q, only: [:index, :click, :click_a, :click_b, :search, :click_search, :click_search_a, :click_search_b]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy ]

  def index
    @care_users = CareUser.page(params[:page]).per(10).joins(:intermediates).includes(:intermediates).where(intermediates: {user_id: current_user.id}).order('intermediates.indication DESC', 'care_users.kana')
    @count = Intermediate.where(user_id: current_user.id, indication: "更新後未確認")
    @kana = CareUser.all.order(kana: "ASC")

    @order = "DESC"
    @grade = "DESC"
    @department = "DESC"

    @sort = {order: @order, grade: @grade, department: @department}

  end

  def click

    # binding.pry
    # params = {id: "DESK"}
    # params[:id] => "DESK"

    order = params[:order]
    grade = params[:grade]
    department = params[:department] 

    @care_users = CareUser.page(params[:page]).per(10).joins(:intermediates).includes(:intermediates).where(intermediates: {user_id: current_user.id}).order("intermediates.indication DESC", "care_users.kana #{order}")

    if order == "ASC"
      order = "DESC"
    elsif order == "DESC"
      order = "ASC"
    end

    @sort = {order: order, grade: grade, department: department} 

    render "care_users/index"

  end


  def click_a

    # binding.pry
    # params = {id: "DESK"}
    # params[:id] => "DESK"

    grade = params[:grade]
    order = params[:order]
    department = params[:department] 

    @care_users = CareUser.page(params[:page]).per(10).joins(:intermediates).includes(:intermediates).where(intermediates: {user_id: current_user.id}).order("intermediates.indication DESC", "care_users.grade #{grade}")

    if grade == "ASC"
      grade = "DESC"
    elsif grade == "DESC"
      grade = "ASC"
    end

    @sort = {order: order, grade: grade, department: department} 
    render "care_users/index"

  end


  def click_b

    # binding.pry
    # params = {id: "DESK"}
    # params[:id] => "DESK"

    grade = params[:grade]
    order = params[:order]
    department = params[:department] 

    @care_users = CareUser.page(params[:page]).per(10).joins(:intermediates).includes(:intermediates).where(intermediates: {user_id: current_user.id}).order("intermediates.indication DESC", "care_users.department #{department}")

    if department == "ASC"
      department = "DESC"
    elsif department == "DESC"
      department = "ASC"
    end

    @sort = {order: order, grade: grade, department: department} 
    render "care_users/index"

  end



  def new
    @care_user = CareUser.new
    @use_day = $days_of_the_week
  end

  def create
    ActiveRecord::Base.transaction do
      # CareUserの登録
      @care_user = CareUser.new(care_user_params)
      @use_day = $days_of_the_week
      # ↓参考：https://qiita.com/xusaku_/items/570b0be745901d2e9a63
      params[:care_user][:use_day] ? @care_user.use_day = params[:care_user][:use_day].join(",") : false
      @care_user.save!

      # Intermediateの登録
      user_ids = User.all.select(:id)
      # User.alluser
      # User.find(1)
      # User.find_by(name: "test")
      # User.where(name: "test")
      # => <User ~ id: 1, name: "test", age: 30 ・・・・>
      # User.all.select(:id)
      # =>  <User ~ id: 1>
      user_ids.each do |user|
        intermediate = Intermediate.new(user_id: user.id, care_user_id: @care_user.id, indication: 1)
        intermediate.save!
      end
      flash[:success] = '新規作成に成功しました。'
      send_message = "新規の利用者が登録されました。ご確認をお願い致します"
      CareUser.broad_push(send_message)
      redirect_to @care_user
    end
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = '登録内容に誤りがあります。'
    render :new
  end

  def edit
    @use_day = $days_of_the_week
  end

  def update
    if @care_user.update_attributes(care_user_params)
      @intermediate = Intermediate.where(care_user_id: params[:id])
      @intermediate.update(indication: "更新後未確認" )
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

  def search
    array = []
    @results = @q.result.joins(:intermediates).includes(:intermediates).where(intermediates: {user_id: current_user.id}).order('intermediates.indication DESC', 'care_users.kana')
    @results.each do |care_user|
      array.push({
        # ひとまずnameが出るかをテスト
        name: care_user.name,
      })
    end
    @care_user = Kaminari.paginate_array(@results).page(params[:page]).per(10)
    @count = @results.joins(:intermediates).includes(:intermediates).select("intermediates.count").where(intermediates: { user_id: current_user.id, indication: "更新後未確認" })

    @order = "DESC"
    @grade = "DESC"
    @department = "DESC"

    q = {"name_or_department_cont": params[:q]["name_or_department_cont"], "department_cont": params[:q]["department_cont"]}
    @sort = {order: @order, grade: @grade, department: @department, q: q}

  end


  def click_search

    order = params[:order]
    grade = params[:grade]


    # binding.pry
    # params = {id: "DESK"}
    # params[:id] => "DESK"
    array = []
    @results = @q.result.joins(:intermediates).includes(:intermediates).where(intermediates: {user_id: current_user.id}).order('intermediates.indication DESC', "care_users.kana #{order}")
    @results.each do |care_user|
      array.push({
        # ひとまずnameが出るかをテスト
        name: care_user.name,
      })
    end


    @care_user = Kaminari.paginate_array(@results).page(params[:page]).per(10)
    @count = @results.joins(:intermediates).includes(:intermediates).select("intermediates.count").where(intermediates: { user_id: current_user.id, indication: "更新後未確認" })


    if order == "ASC"
      order = "DESC"
    elsif order == "DESC"
      order = "ASC"
    end

    q = {"name_or_department_cont": params[:q]["name_or_department_cont"], "department_cont": params[:q]["department_cont"]}
    @sort = {order: order, grade: grade, q: q}

    render "care_users/search"

  end


  def click_search_a

    grade = params[:grade]
    order = params[:order]


    # binding.pry
    # params = {id: "DESK"}
    # params[:id] => "DESK"
    array = []
    @results = @q.result.joins(:intermediates).includes(:intermediates).where(intermediates: {user_id: current_user.id}).order('intermediates.indication DESC', "care_users.grade #{grade}")
    @results.each do |care_user|
      array.push({
        # ひとまずnameが出るかをテスト
        name: care_user.name,
      })
    end


    @care_user = Kaminari.paginate_array(@results).page(params[:page]).per(10)
    @count = @results.joins(:intermediates).includes(:intermediates).select("intermediates.count").where(intermediates: { user_id: current_user.id, indication: "更新後未確認" })


    if grade == "ASC"
      grade = "DESC"
    elsif grade == "DESC"
      grade = "ASC"
    end

    q = {"name_or_department_cont": params[:q]["name_or_department_cont"], "department_cont": params[:q]["department_cont"]}
    @sort = {order: order, grade: grade, q: q}

    render "care_users/search"

  end

  def click_search_b

    grade = params[:grade]
    order = params[:order]
    department = params[:department]


    # binding.pry
    # params = {id: "DESK"}
    # params[:id] => "DESK"
    array = []
    @results = @q.result.joins(:intermediates).includes(:intermediates).where(intermediates: {user_id: current_user.id}).order('intermediates.indication DESC', "care_users.department #{department}")
    @results.each do |care_user|
      array.push({
        # ひとまずnameが出るかをテスト
        name: care_user.name,
      })
    end


    @care_user = Kaminari.paginate_array(@results).page(params[:page]).per(10)
    @count = @results.joins(:intermediates).includes(:intermediates).select("intermediates.count").where(intermediates: { user_id: current_user.id, indication: "更新後未確認" })


    if department == "ASC"
      department = "DESC"
    elsif department == "DESC"
      department = "ASC"
    end

    q = {"name_or_department_cont": params[:q]["name_or_department_cont"], "department_cont": params[:q]["department_cont"]}
    @sort = {order: order, grade: grade, department: department, q: q}

    render "care_users/search"

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




