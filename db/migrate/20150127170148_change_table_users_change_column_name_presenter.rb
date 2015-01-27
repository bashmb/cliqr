class ChangeTableUsersChangeColumnNamePresenter < ActiveRecord::Migration
  def change
    remove_column :users, :presenter?

    add_column :users, :presenter, :boolean, default: false
  end
end
