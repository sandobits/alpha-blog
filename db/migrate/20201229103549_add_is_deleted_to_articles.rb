class AddIsDeletedToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :is_deleted, :boolean
    add_column :articles, :deleted_at, :datetime
  end
end
