class AddAuthorIdToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :author_id, :integer
  end
end
