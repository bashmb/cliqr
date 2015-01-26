class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question
      t.references :user
      t.string :content
      t.integer :upvote
      t.integer :downvote
      t.boolean :vetted?

      t.timestamps null: false
    end
  end
end
