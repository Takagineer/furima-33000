class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.string   :title               , null: false, default: ""
      t.text     :explanation         , null: false,default: ""
      t.integer  :category_id         , null: false, default: ""
      t.integer  :status_id           , null: false, default: ""
      t.integer  :shipping_cost_id    , null: false, default: ""
      t.integer  :delivery_source_id  , null: false, default: ""
      t.integer  :preparation_day_id  , null: false, default: ""
      t.integer  :selling_price       , null: false, default: ""
      t.integer   :user_id            , null: false, default: ""

      t.timestamps
    end
  end
end
