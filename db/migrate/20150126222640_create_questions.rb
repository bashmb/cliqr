class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :upvote
      t.integer :downvote
      t.references :user

      t.timestamps null: false
    end
  end
end
