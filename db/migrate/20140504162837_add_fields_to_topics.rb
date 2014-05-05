class AddFieldsToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :name, :string
    add_column :topics, :description, :text
  end
end
