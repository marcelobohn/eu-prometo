class CreateManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :managers do |t|
      t.string :name
      t.references :election, foreign_key: true
      t.integer :country_id
      t.integer :state_id
      t.integer :city_id
      t.integer :type_manager
      t.date :start
      t.date :end
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
