class CreatePromises < ActiveRecord::Migration[5.1]
  def change
    create_table :promises do |t|
      t.references :manager, foreign_key: true
      t.text :description
      t.date :date_finish
      t.text :description_finish
      t.references :user, foreign_key: true
      t.integer :user_finish

      t.timestamps
    end
  end
end
