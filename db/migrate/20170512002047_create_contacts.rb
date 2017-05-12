class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :type_contact
      t.text :description
      t.references :user, foreign_key: true
      t.datetime :readed

      t.timestamps
    end
  end
end
