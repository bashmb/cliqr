class DropTablesDownVote < ActiveRecord::Migration
  def change
    drop_table :downvotes
  end
end
