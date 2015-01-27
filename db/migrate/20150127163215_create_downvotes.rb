class CreateDownvotes < ActiveRecord::Migration
  def change
    create_table :downvotes do |t|
      t.references :user
      t.references :vote, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
