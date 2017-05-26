class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :description
      t.references :user, foreign_key: true
      t.references :promise, foreign_key: true
      t.integer :type_comment

      t.timestamps
    end
  end
end
