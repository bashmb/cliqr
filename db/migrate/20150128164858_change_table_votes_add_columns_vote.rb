class ChangeTableVotesAddColumnsVote < ActiveRecord::Migration
  def change
    add_column :votes, :vote_id, :integer
    add_column :votes, :vote_type, :string

    add_index :votes, [:vote_id, :vote_type]
  end
end
