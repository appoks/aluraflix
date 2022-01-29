class ApplyNotNullableToCategoryId < ActiveRecord::Migration[6.1]
  def change
    change_column_null :videos, :category_id, false
    change_column_default :videos, :category_id, 1
  end
end
