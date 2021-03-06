class CreateIntermediates < ActiveRecord::Migration[5.2]
  def change
    create_table :intermediates do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :care_user, null: false, index: true, foreign_key: true
      t.integer :indication, default: 0, null: false
  
      t.timestamps

      # add_index :intermediates, :user_id
      # add_index :intermediates, :care_user_id
      # add_index :intermediates, [:user_id, :care_user_id], unique: true
    end
  end
end