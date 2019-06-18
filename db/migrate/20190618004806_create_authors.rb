class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :first_name, limit: 50
      t.string :last_name, limit: 50

      t.timestamps
    end
  end
end
