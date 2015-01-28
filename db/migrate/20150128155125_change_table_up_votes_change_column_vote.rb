class ChangeTableUpVotesChangeColumnVote < ActiveRecord::Migration
  def change
    change_table :upvotes do |t|
      t.rename :vote_id, :content_id
      t.rename :vote_type, :content_type
    end
  end
end
