class CreateElections < ActiveRecord::Migration[5.1]
  def change
    create_table :elections do |t|
      t.integer :year
      t.integer :type
      t.string :description

      t.timestamps
    end
  end
end
