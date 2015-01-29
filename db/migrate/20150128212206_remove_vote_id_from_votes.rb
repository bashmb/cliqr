class RemoveVoteIdFromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :vote_id
  end
end
