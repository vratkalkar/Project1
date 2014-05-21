class AddStatusToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :paid, :boolean
  end
end
