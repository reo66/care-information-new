class CreateCareUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :care_users do |t|
      t.string :name
      t.integer :age
      t.integer :gender
      t.string :school

      t.timestamps
    end
  end
end
