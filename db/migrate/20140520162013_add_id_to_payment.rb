class AddIdToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :article_id, :integer
  end
end
