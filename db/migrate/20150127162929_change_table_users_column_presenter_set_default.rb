class ChangeTableUsersColumnPresenterSetDefault < ActiveRecord::Migration
  def change
    change_column :users, :presenter?, :boolean, default: false
  end
end
