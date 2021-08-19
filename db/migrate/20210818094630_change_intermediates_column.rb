class ChangeIntermediatesColumn < ActiveRecord::Migration[5.2]
  def up
    # remove_column :intermediates, :confirmation
    change_column :intermediates, :indication, :integer, default: 0, null: false
  end
end
