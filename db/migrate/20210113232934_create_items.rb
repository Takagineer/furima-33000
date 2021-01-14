class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.string   :title               , null: false, default: ""
      t.text     :explanation         , null: false
      t.integer  :category_id         , null: false
      t.integer  :status_id           , null: false
      t.integer  :shipping_cost_id    , null: false
      t.integer  :delivery_source_id  , null: false
      t.integer  :preparation_day_id  , null: false
      t.integer  :selling_price       , null: false
      t.integer  :user_id             , null: false,foreign_key: true 

      t.timestamps
    end
  end
end
