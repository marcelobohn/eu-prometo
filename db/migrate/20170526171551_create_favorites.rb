class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :promise, foreign_key: true
      t.date :remove

      t.timestamps
    end
  end
end
