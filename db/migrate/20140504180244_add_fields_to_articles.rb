class AddFieldsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :body, :text
    add_column :articles, :title, :string
  end
end
