class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :content, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
