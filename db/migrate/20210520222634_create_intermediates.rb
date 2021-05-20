class CreateIntermediates < ActiveRecord::Migration[5.2]
  def change
    create_table :intermediates do |t|
      t.references :user, foregin_key: true
      t.references :careuser, foregin_key: true
      t.timestamps
    end
  end
end
