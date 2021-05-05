class AddInformationToCareUsers < ActiveRecord::Migration[5.2]
  def change

    # 契約日数
    add_column :care_users, :contract, :integer
    # 利用曜日
    add_column :care_users, :use_day, :date
    # 住まい
    add_column :care_users, :house, :string
    # 障害名
    add_column :care_users, :disabled, :string
    # 食事
    add_column :care_users, :eat, :string
    # 排泄
    add_column :care_users, :evacuation, :string
    # 着替え
    add_column :care_users, :cange_clothes, :string
    # おむつ
    add_column :care_users, :diapers, :boolean
    # パット
    add_column :care_users, :pat, :boolean
    # アレルギー
    add_column :care_users, :allergy, :string
    # 発作
    add_column :care_users, :seizures, :boolean
    # 服薬
    add_column :care_users, :medicine, :boolean
    # 意思疎通（利用者⇨スタッフ）
    add_column :care_users, :communicate_a, :string
    # 意思疎通概要（利用者⇨スタッフ）
    add_column :care_users, :communicate_summary_a, :string
    # 意思疎通（スタッフ⇨利用者）
    add_column :care_users, :communicate_b, :string
    # 意思疎通概要（スタッフ⇨利用者）
    add_column :care_users, :communicate_summary_b, :string
    # 室内の様子
    add_column :care_users, :indoor, :text
    # 戸外の様子
    add_column :care_users, :outdoor, :text
    # 概要
    add_column :care_users, :summary, :text
    # ユーザー確認
    add_column :care_users, :cuser_confirm, :boolean
  
  end
end
