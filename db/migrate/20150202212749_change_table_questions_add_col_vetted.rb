class ChangeTableQuestionsAddColVetted < ActiveRecord::Migration
  def change
    add_column :questions, :vetted, :boolean
  end
end
