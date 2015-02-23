class AddPostToVote < ActiveRecord::Migration
  def change
    add_column :votes, :post_id, :interger
    add_index :votes, :post_id
  end
end
