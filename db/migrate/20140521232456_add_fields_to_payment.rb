class AddFieldsToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :created_at, :datetime
  end
end
