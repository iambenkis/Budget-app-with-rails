class CreateJoinTableCategoryDeal < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :deals do |t|
      t.index [:category_id, :deal_id]
    end
  end
end
