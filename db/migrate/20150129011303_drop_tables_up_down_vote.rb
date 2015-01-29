class DropTablesUpDownVote < ActiveRecord::Migration
  def change
    drop_table :upvotes, :downvotes
  end
end
