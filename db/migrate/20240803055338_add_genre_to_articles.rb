class AddGenreToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :genre, :string
  end
end
