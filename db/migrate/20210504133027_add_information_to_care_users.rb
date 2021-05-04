class AddInformationToCareUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :care_users, :house, :string
  end
end
