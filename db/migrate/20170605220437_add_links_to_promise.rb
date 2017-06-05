class AddLinksToPromise < ActiveRecord::Migration[5.1]
  def change
    add_column :promises, :video_link, :string
    add_column :promises, :image_link, :string
    add_column :promises, :authorized, :date
  end
end
