class AddLinkNewsToPromise < ActiveRecord::Migration[5.1]
  def change
    add_column :promises, :news_link, :string
    add_column :promises, :type_promise, :integer
  end
end
