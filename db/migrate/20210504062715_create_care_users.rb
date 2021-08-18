class CreateCareUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :care_users do |t|
      t.string :image
      t.string :department, null: false
      t.string :name, null: false
      t.string :kana, null: false
      t.integer :age
      t.integer :gender
      t.string :school
      t.timestamps
    end
  end
end
