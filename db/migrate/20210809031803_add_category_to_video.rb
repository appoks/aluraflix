class AddCategoryToVideo < ActiveRecord::Migration[6.1]
  def change
    add_reference :videos, :category, null: true, foreign_key: true
  end
end
