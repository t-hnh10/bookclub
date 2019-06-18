class AddGenreToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :genre, :string, limit: 100
  end
end
