class ChangeTableColNameVetted < ActiveRecord::Migration
  def change
    rename_column :answers, :vetted?, :vetted
  end
end
