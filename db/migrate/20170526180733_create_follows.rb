class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.references :user, foreign_key: true
      t.references :manager, foreign_key: true
      t.date :unfollow

      t.timestamps
    end
  end
end
