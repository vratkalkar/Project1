class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :payments, :user_id, :integer
  end
end
